import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/track.dart';

part 'tracks_state.freezed.dart';

@freezed
class TracksState with _$TracksState {
  const factory TracksState.initial() = TracksInitial;
  const factory TracksState.loading() = TracksLoading;
  const factory TracksState.loaded(List<Track> tracks) = TracksLoaded;
  const factory TracksState.error(String message) = TracksError;
}
