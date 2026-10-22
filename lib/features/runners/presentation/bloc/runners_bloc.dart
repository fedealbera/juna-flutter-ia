import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/runners_repository.dart';
import 'runners_event.dart';
import 'runners_state.dart';

@injectable
class RunnersBloc extends Bloc<RunnersEvent, RunnersState> {
  final RunnersRepository _runnersRepository;

  RunnersBloc(this._runnersRepository) : super(const RunnersState.initial()) {
    on<GetRunnersEvent>((event, emit) async {
      emit(const RunnersState.loading());
      try {
        final runners = await _runnersRepository.getRunnersList(
          eventId: event.eventId,
          orgId: event.orgId,
        );
        emit(RunnersState.loaded(runners: runners));
      } catch (e) {
        emit(RunnersState.error(e.toString()));
      }
    });

    on<RefreshRunnersEvent>((event, emit) async {
      try {
        final runners = await _runnersRepository.getRunnersList(
          eventId: event.eventId,
          orgId: event.orgId,
        );
        emit(RunnersState.loaded(runners: runners));
      } catch (e) {
        emit(RunnersState.error(e.toString()));
      }
    });
  }
}
