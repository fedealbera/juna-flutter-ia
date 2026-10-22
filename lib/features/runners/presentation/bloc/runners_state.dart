import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/runner_item.dart';

part 'runners_state.freezed.dart';

@freezed
class RunnersState with _$RunnersState {
  const factory RunnersState.initial() = RunnersInitial;
  const factory RunnersState.loading() = RunnersLoading;
  const factory RunnersState.loaded({
    required List<RunnerItem> runners,
  }) = RunnersLoaded;
  const factory RunnersState.error(String message) = RunnersError;
}
