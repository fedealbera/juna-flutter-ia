import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_event.freezed.dart';

@freezed
class EventEvent with _$EventEvent {
  const factory EventEvent.getCircuits() = FetchCircuits;
}
