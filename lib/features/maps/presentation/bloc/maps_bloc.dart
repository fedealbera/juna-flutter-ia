import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_map_settings.dart';
import 'maps_event.dart';
import 'maps_state.dart';

@injectable
class MapsBloc extends Bloc<MapsEvent, MapsState> {
  final GetMapSettings _getMapSettings;

  MapsBloc(this._getMapSettings) : super(const MapsState.initial()) {
    on<LoadMapSettings>((event, emit) async {
      emit(const MapsState.loading());
      try {
        final settings = await _getMapSettings();
        emit(MapsState.loaded(settings));
      } catch (e) {
        emit(MapsState.error(e.toString()));
      }
    });
  }
}
