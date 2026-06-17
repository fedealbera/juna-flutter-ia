import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/sos_result.dart';

part 'emergency_state.freezed.dart';

@freezed
class EmergencyState with _$EmergencyState {
  const factory EmergencyState.initial() = EmergencyInitial;
  const factory EmergencyState.loading() = EmergencyLoading;
  const factory EmergencyState.sosSent(SosResult result) = EmergencySosSent;
  const factory EmergencyState.error(String message) = EmergencyError;
}
