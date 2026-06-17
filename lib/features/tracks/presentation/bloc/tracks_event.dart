import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracks_event.freezed.dart';

@freezed
class TracksEvent with _$TracksEvent {
  const factory TracksEvent.getTracks({required String eventId}) = FetchTracks;
}
