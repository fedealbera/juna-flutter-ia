import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_event.freezed.dart';

@freezed
class ContentEvent with _$ContentEvent {
  const factory ContentEvent.getEventContent({
    required String eventId,
    required String idOrg,
  }) = FetchContent;
}
