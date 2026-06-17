import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_circuits.dart';
import 'event_event.dart';
import 'event_state.dart';

@injectable
class EventBloc extends Bloc<EventEvent, EventState> {
  final GetCircuits _getCircuits;

  EventBloc(this._getCircuits) : super(const EventState.initial()) {
    on<FetchCircuits>((event, emit) async {
      emit(const EventState.loading());
      try {
        final circuits = await _getCircuits();
        emit(EventState.loaded(circuits));
      } catch (e) {
        emit(EventState.error(e.toString()));
      }
    });
  }
}
