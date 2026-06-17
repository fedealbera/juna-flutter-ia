import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:event_platform_v3/features/geography/data/datasource/geography_remote_datasource.dart';
import 'package:event_platform_v3/features/geography/data/repositories/geography_repository_impl.dart';
import 'package:event_platform_v3/features/geography/data/dto/response/pais_response_dto.dart';
import 'package:event_platform_v3/features/geography/data/dto/response/provincia_response_dto.dart';
import 'package:event_platform_v3/features/geography/data/dto/response/ciudad_response_dto.dart';

class MockGeographyRemoteDataSource extends Mock implements GeographyRemoteDataSource {}

void main() {
  late GeographyRepositoryImpl repository;
  late MockGeographyRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockGeographyRemoteDataSource();
    repository = GeographyRepositoryImpl(mockRemoteDataSource);
  });

  group('GeographyRepositoryImpl', () {
    test('getCountries should return list of Country entities mapped from DTOs', () async {
      // Arrange
      final dtos = [
        const PaisResponseDto(rawJson: {'id': 'AR', 'nombre': 'Argentina'}),
      ];
      when(() => mockRemoteDataSource.getPaises()).thenAnswer((_) async => dtos);

      // Act
      final result = await repository.getCountries();

      // Assert
      expect(result.length, 1);
      expect(result.first.name, 'Argentina');
      verify(() => mockRemoteDataSource.getPaises()).called(1);
    });

    test('getProvincias should return list of Province entities mapped from DTOs', () async {
      // Arrange
      const paisId = 'AR';
      final dtos = [
        const ProvinciaResponseDto(rawJson: {'id': '1', 'nombre': 'Buenos Aires'}),
      ];
      when(() => mockRemoteDataSource.getProvincias(paisId)).thenAnswer((_) async => dtos);

      // Act
      final result = await repository.getProvincias(paisId);

      // Assert
      expect(result.length, 1);
      expect(result.first.name, 'Buenos Aires');
      verify(() => mockRemoteDataSource.getProvincias(paisId)).called(1);
    });

    test('getCiudades should return list of City entities mapped from DTOs', () async {
      // Arrange
      const provinciaId = '1';
      final dtos = [
        const CiudadResponseDto(rawJson: {'id': '10', 'nombre': 'La Plata'}),
      ];
      when(() => mockRemoteDataSource.getCiudades(provinciaId)).thenAnswer((_) async => dtos);

      // Act
      final result = await repository.getCiudades(provinciaId);

      // Assert
      expect(result.length, 1);
      expect(result.first.name, 'La Plata');
      verify(() => mockRemoteDataSource.getCiudades(provinciaId)).called(1);
    });
  });
}
