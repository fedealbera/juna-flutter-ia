import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_event_settings.dart';
import 'settings_event.dart';
import 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetEventSettings _getEventSettings;

  SettingsBloc(this._getEventSettings) : super(const SettingsState.initial()) {
    on<FetchSettings>((event, emit) async {
      emit(const SettingsState.loading());
      try {
        final settings = await _getEventSettings(
          eventId: event.eventId,
          idOrg: event.idOrg,
        );
        emit(SettingsState.loaded(settings));
      } catch (e) {
        emit(SettingsState.error(e.toString()));
      }
    });
  }
}
