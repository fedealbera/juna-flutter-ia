import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_tracks.dart';
import 'tracks_event.dart';
import 'tracks_state.dart';

@injectable
class TracksBloc extends Bloc<TracksEvent, TracksState> {
  final GetTracks _getTracks;

  TracksBloc(this._getTracks) : super(const TracksState.initial()) {
    on<FetchTracks>((event, emit) async {
      emit(const TracksState.loading());
      try {
        final tracks = await _getTracks(eventId: event.eventId);
        emit(TracksState.loaded(tracks));
      } catch (e) {
        emit(TracksState.error(e.toString()));
      }
    });
  }
}
