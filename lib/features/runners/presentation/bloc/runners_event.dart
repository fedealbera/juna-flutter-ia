import 'package:freezed_annotation/freezed_annotation.dart';

part 'runners_event.freezed.dart';

@freezed
class RunnersEvent with _$RunnersEvent {
  const factory RunnersEvent.getRunners({
    required String eventId,
    required String orgId,
  }) = GetRunnersEvent;

  const factory RunnersEvent.refresh({
    required String eventId,
    required String orgId,
  }) = RefreshRunnersEvent;
}
