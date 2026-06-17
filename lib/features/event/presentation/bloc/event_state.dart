import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/circuit.dart';

part 'event_state.freezed.dart';

@freezed
class EventState with _$EventState {
  const factory EventState.initial() = EventInitial;
  const factory EventState.loading() = EventLoading;
  const factory EventState.loaded(List<Circuit> circuits) = EventLoaded;
  const factory EventState.error(String message) = EventError;
}
