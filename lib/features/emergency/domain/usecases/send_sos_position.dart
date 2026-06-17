import 'package:injectable/injectable.dart';
import '../entities/sos_result.dart';
import '../repositories/emergency_repository.dart';

@lazySingleton
class SendSOSPosition {
  final EmergencyRepository _repository;

  SendSOSPosition(this._repository);

  Future<SosResult> call({
    required String partiId,
    required String eventoId,
    required String orgId,
    required String latitud,
    required String longitud,
  }) {
    return _repository.sendSos(
      partiId: partiId,
      eventoId: eventoId,
      orgId: orgId,
      latitud: latitud,
      longitud: longitud,
    );
  }
}
