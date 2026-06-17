import '../../domain/entities/circuit.dart';

abstract class EventRepository {
  Future<List<Circuit>> getCircuits();
}
