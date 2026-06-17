import 'package:injectable/injectable.dart';
import '../entities/circuit.dart';
import '../repositories/event_repository.dart';

@lazySingleton
class GetCircuits {
  final EventRepository _repository;

  GetCircuits(this._repository);

  Future<List<Circuit>> call() {
    return _repository.getCircuits();
  }
}
