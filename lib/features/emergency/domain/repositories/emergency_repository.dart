import '../entities/sos_result.dart';

abstract class EmergencyRepository {
  Future<SosResult> sendSos({
    required String partiId,
    required String eventoId,
    required String orgId,
    required String latitud,
    required String longitud,
  });
}
