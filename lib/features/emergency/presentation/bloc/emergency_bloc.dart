import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/send_sos_position.dart';
import 'emergency_event.dart';
import 'emergency_state.dart';

@injectable
class EmergencyBloc extends Bloc<EmergencyEvent, EmergencyState> {
  final SendSOSPosition _sendSOSPosition;

  EmergencyBloc(this._sendSOSPosition) : super(const EmergencyState.initial()) {
    on<SendSos>((event, emit) async {
      emit(const EmergencyState.loading());
      try {
        final result = await _sendSOSPosition(
          partiId: event.partiId,
          eventoId: event.eventoId,
          orgId: event.orgId,
          latitud: event.latitud,
          longitud: event.longitud,
        );
        emit(EmergencyState.sosSent(result));
      } catch (e) {
        emit(EmergencyState.error(e.toString()));
      }
    });
  }
}
