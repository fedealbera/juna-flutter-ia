import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/map_settings.dart';

part 'maps_state.freezed.dart';

@freezed
class MapsState with _$MapsState {
  const factory MapsState.initial() = MapsInitial;
  const factory MapsState.loading() = MapsLoading;
  const factory MapsState.loaded(MapSettings settings) = MapsLoaded;
  const factory MapsState.error(String message) = MapsError;
}
