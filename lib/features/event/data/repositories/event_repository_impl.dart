import 'package:injectable/injectable.dart';
import '../../../catalog/data/datasource/catalog_remote_datasource.dart';
import '../../domain/entities/circuit.dart';
import '../../domain/entities/circuito_coordenadas.dart';
import '../../domain/repositories/event_repository.dart';
import '../mappers/circuit_mapper.dart';

@LazySingleton(as: EventRepository)
class EventRepositoryImpl implements EventRepository {
  final CatalogRemoteDataSource _catalogRemoteDataSource;

  EventRepositoryImpl(this._catalogRemoteDataSource);

  @override
  Future<List<Circuit>> getCircuits() async {
    final dtos = await _catalogRemoteDataSource.getCircuitos();
    return dtos.map(CircuitMapper.toEntity).toList();
  }

  @override
  Future<CircuitoCoordenadas> getCircuitCoordinates(String circuitId) async {
    final dto = await _catalogRemoteDataSource.getCircuitoCoordenadas(circuitId);
    return dto.toEntity();
  }
}
