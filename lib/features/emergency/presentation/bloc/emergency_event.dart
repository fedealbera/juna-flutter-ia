import 'package:freezed_annotation/freezed_annotation.dart';

part 'emergency_event.freezed.dart';

@freezed
class EmergencyEvent with _$EmergencyEvent {
  const factory EmergencyEvent.sendSos({
    required String partiId,
    required String eventoId,
    required String orgId,
    required String latitud,
    required String longitud,
  }) = SendSos;
}
