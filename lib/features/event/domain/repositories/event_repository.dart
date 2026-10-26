import '../../domain/entities/circuit.dart';
import '../entities/circuito_coordenadas.dart';

abstract class EventRepository {
  Future<List<Circuit>> getCircuits();
  Future<CircuitoCoordenadas> getCircuitCoordinates(String circuitId);
}
