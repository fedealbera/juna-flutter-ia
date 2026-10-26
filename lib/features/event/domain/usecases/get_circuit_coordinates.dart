import 'package:injectable/injectable.dart';
import '../entities/circuito_coordenadas.dart';
import '../repositories/event_repository.dart';

@lazySingleton
class GetCircuitCoordinates {
  final EventRepository _repository;

  GetCircuitCoordinates(this._repository);

  Future<CircuitoCoordenadas> call(String circuitId) {
    return _repository.getCircuitCoordinates(circuitId);
  }
}
