import 'package:event_platform_v3/features/catalog/data/datasource/catalog_remote_datasource.dart';
import 'package:event_platform_v3/features/catalog/data/dto/response/categoria_response_dto.dart';
import 'package:event_platform_v3/features/catalog/data/dto/response/circuito_coordenadas_dto.dart';
import 'package:event_platform_v3/features/catalog/data/dto/response/circuito_response_dto.dart';
import 'package:event_platform_v3/features/catalog/data/dto/response/talle_response_dto.dart';
import 'package:event_platform_v3/features/event/data/repositories/event_repository_impl.dart';
import 'package:event_platform_v3/features/event/domain/entities/circuito_coordenadas.dart';
import 'package:event_platform_v3/features/event/domain/usecases/get_circuit_coordinates.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeCatalogRemoteDataSource implements CatalogRemoteDataSource {
  final CircuitoCoordenadasDto coordenadasResponse;
  final bool shouldFail;

  FakeCatalogRemoteDataSource({
    required this.coordenadasResponse,
    this.shouldFail = false,
  });

  @override
  Future<CircuitoCoordenadasDto> getCircuitoCoordenadas(String circuitoId) async {
    if (shouldFail) throw Exception('Network error');
    return coordenadasResponse;
  }

  @override
  Future<List<CircuitoResponseDto>> getCircuitos() async => [];

  @override
  Future<List<CategoriaResponseDto>> getCategorias(String circuitoId, String dni) async => [];

  @override
  Future<List<TalleResponseDto>> getTalles() async => [];

  @override
  Future<List<Map<String, dynamic>>> getCentrosAcreditacion() async => [];

  @override
  Future<List<Map<String, dynamic>>> getMarcas(String? tipoCarrera) async => [];

  @override
  Future<List<Map<String, dynamic>>> getGruposEntrenamiento(String tipoCarrera) async => [];

  @override
  Future<Map<String, dynamic>> createGrupoEntrenamiento(String nombre, String tipoCarrera) async => {};
}

void main() {
  group('CircuitoCoordenadasDto & CoordenadaPuntoDto', () {
    test('parses json correctly and maps to domain entity', () {
      final json = {
        'circuito_id': 2,
        'circuito_nombre': '21K',
        'circuito_nombre_corto': '21K',
        'total_puntos': 2,
        'coordenadas': [
          {
            'id': 1,
            'lat': -26.8325,
            'lng': -65.2041,
            'ele': 450.5,
            'dist': 0.0,
          },
          {
            'id': 2,
            'lat': -26.8335,
            'lng': -65.2055,
            'ele': 455.0,
            'dist': 250.0,
          },
        ],
        'error': null,
      };

      final dto = CircuitoCoordenadasDto.fromJson(json);

      expect(dto.circuitoId, equals(2));
      expect(dto.circuitoNombre, equals('21K'));
      expect(dto.circuitoNombreCorto, equals('21K'));
      expect(dto.totalPuntos, equals(2));
      expect(dto.coordenadas.length, equals(2));
      expect(dto.error, isNull);

      final firstPunto = dto.coordenadas[0];
      expect(firstPunto.id, equals(1));
      expect(firstPunto.lat, equals(-26.8325));
      expect(firstPunto.lng, equals(-65.2041));
      expect(firstPunto.ele, equals(450.5));
      expect(firstPunto.dist, equals(0.0));

      // Test conversion to domain entity
      final entity = dto.toEntity();
      expect(entity, isA<CircuitoCoordenadas>());
      expect(entity.circuitoId, equals(2));
      expect(entity.hasPoints, isTrue);
      expect(entity.startPoint?.id, equals(1));
      expect(entity.endPoint?.id, equals(2));
      expect(entity.startPoint?.lat, equals(-26.8325));
      expect(entity.endPoint?.dist, equals(250.0));
    });

    test('handles empty coordenadas array and zero values gracefully', () {
      final json = {
        'circuito_id': 5,
        'circuito_nombre': '5K',
        'circuito_nombre_corto': '5K',
        'total_puntos': 0,
        'coordenadas': [],
        'error': null,
      };

      final dto = CircuitoCoordenadasDto.fromJson(json);
      expect(dto.circuitoId, equals(5));
      expect(dto.coordenadas, isEmpty);
      expect(dto.totalPuntos, equals(0));

      final entity = dto.toEntity();
      expect(entity.hasPoints, isFalse);
      expect(entity.startPoint, isNull);
      expect(entity.endPoint, isNull);
    });

    test('safely parses integer numbers as doubles in coordinates', () {
      final jsonPunto = {
        'id': 10,
        'lat': -26,
        'lng': -65,
        'ele': 400,
        'dist': 1000,
      };

      final dto = CoordenadaPuntoDto.fromJson(jsonPunto);
      expect(dto.id, equals(10));
      expect(dto.lat, equals(-26.0));
      expect(dto.lng, equals(-65.0));
      expect(dto.ele, equals(400.0));
      expect(dto.dist, equals(1000.0));

      final entity = dto.toEntity();
      expect(entity, isA<CoordenadaPunto>());
      expect(entity.lat, equals(-26.0));
    });
  });

  group('EventRepository & GetCircuitCoordinates UseCase', () {
    test('returns CircuitoCoordenadas successfully from repository and usecase', () async {
      const mockDto = CircuitoCoordenadasDto(
        circuitoId: 2,
        circuitoNombre: '21K',
        circuitoNombreCorto: '21K',
        totalPuntos: 1,
        coordenadas: [
          CoordenadaPuntoDto(
            id: 1,
            lat: -26.8325,
            lng: -65.2041,
            ele: 450.5,
            dist: 0.0,
          ),
        ],
      );

      final fakeDataSource = FakeCatalogRemoteDataSource(coordenadasResponse: mockDto);
      final repository = EventRepositoryImpl(fakeDataSource);
      final useCase = GetCircuitCoordinates(repository);

      final result = await useCase('2');

      expect(result.circuitoId, equals(2));
      expect(result.circuitoNombre, equals('21K'));
      expect(result.coordenadas.length, equals(1));
      expect(result.coordenadas.first.lat, equals(-26.8325));
    });

    test('propagates exception when remote data source fails', () async {
      const mockDto = CircuitoCoordenadasDto(
        circuitoId: 0,
        circuitoNombre: '',
        circuitoNombreCorto: '',
        totalPuntos: 0,
        coordenadas: [],
      );

      final fakeDataSource = FakeCatalogRemoteDataSource(
        coordenadasResponse: mockDto,
        shouldFail: true,
      );
      final repository = EventRepositoryImpl(fakeDataSource);
      final useCase = GetCircuitCoordinates(repository);

      expect(() => useCase('99'), throwsException);
    });
  });
}
