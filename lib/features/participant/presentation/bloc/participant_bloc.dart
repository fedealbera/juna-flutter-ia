import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/authenticate_participant.dart';
import '../../domain/usecases/get_participant_detail.dart';
import '../../domain/usecases/update_circuito.dart';
import '../../domain/usecases/update_contact.dart';
import '../../domain/usecases/update_emergency.dart';
import '../../domain/usecases/update_participant.dart';
import 'participant_event.dart';
import 'participant_state.dart';

@injectable
class ParticipantBloc extends Bloc<ParticipantEvent, ParticipantState> {
  final AuthenticateParticipant _authenticateParticipant;
  final GetParticipantDetail _getParticipantDetail;
  final UpdateEmergency _updateEmergency;
  final UpdateContact _updateContact;
  final UpdateCircuito _updateCircuito;
  final UpdateParticipant _updateParticipant;

  ParticipantBloc(
    this._authenticateParticipant,
    this._getParticipantDetail,
    this._updateEmergency,
    this._updateContact,
    this._updateCircuito,
    this._updateParticipant,
  ) : super(const ParticipantState.initial()) {
    on<Authenticate>((event, emit) async {
      emit(const ParticipantState.loading());
      try {
        final result = await _authenticateParticipant(
          dni: event.dni,
          idEvento: event.idEvento,
          idOrg: event.idOrg,
          token: event.token,
        );
        emit(ParticipantState.authenticated(result));
      } catch (e) {
        emit(ParticipantState.error(e.toString()));
      }
    });

    on<GetDetail>((event, emit) async {
      emit(const ParticipantState.loading());
      try {
        final result = await _getParticipantDetail(
          dni: event.dni,
          idOrg: event.idOrg,
          eventoId: event.eventoId,
          roundId: event.roundId,
        );
        emit(ParticipantState.detailLoaded(result));
      } catch (e) {
        emit(ParticipantState.error(e.toString()));
      }
    });

    on<UpdateEmergencyEvent>((event, emit) async {
      emit(const ParticipantState.loading());
      try {
        final result = await _updateEmergency(
          partiId: event.partiId,
          contNombre: event.contNombre,
          contTel: event.contTel,
        );
        emit(ParticipantState.emergencyUpdated(result));
      } catch (e) {
        emit(ParticipantState.error(e.toString()));
      }
    });

    on<UpdateContactEvent>((event, emit) async {
      emit(const ParticipantState.loading());
      try {
        final result = await _updateContact(
          partiId: event.partiId,
          domCiudad: event.domCiudad,
          domCiudadNombre: event.domCiudadNombre,
          domProvincia: event.domProvincia,
          domPais: event.domPais,
          contInstagram: event.contInstagram,
          contCelular: event.contCelular,
          contEmail: event.contEmail,
        );
        emit(ParticipantState.contactUpdated(result));
      } catch (e) {
        emit(ParticipantState.error(e.toString()));
      }
    });

    on<UpdateCircuitoEvent>((event, emit) async {
      emit(const ParticipantState.loading());
      try {
        final result = await _updateCircuito(
          partiId: event.partiId,
          insId: event.insId,
          circuitoId: event.circuitoId,
          categoriaId: event.categoriaId,
          talleId: event.talleId,
        );
        emit(ParticipantState.circuitoUpdated(result));
      } catch (e) {
        emit(ParticipantState.error(e.toString()));
      }
    });

    on<UpdateParticipantEvent>((event, emit) async {
      print('ParticipantBloc: UpdateParticipantEvent received for partiId: ${event.partiId}');
      emit(const ParticipantState.loading());
      try {
        print('ParticipantBloc: Calling _updateParticipant use case...');
        final result = await _updateParticipant(
          partiId: event.partiId,
          contNombre: event.contNombre,
          contTel: event.contTel,
          domCiudad: event.domCiudad,
          domCiudadNombre: event.domCiudadNombre,
          domProvincia: event.domProvincia,
          domPais: event.domPais,
          contInstagram: event.contInstagram,
          contCelular: event.contCelular,
          contEmail: event.contEmail,
          insId: event.insId,
          circuitoId: event.circuitoId,
          categoriaId: event.categoriaId,
          talleId: event.talleId,
        );
        print('ParticipantBloc: UpdateParticipant success. Result rawJson: ${result.rawJson}');
        emit(ParticipantState.participantUpdated(result));
      } catch (e, stacktrace) {
        print('ParticipantBloc: Error during updateParticipant: $e');
        print(stacktrace);
        emit(ParticipantState.error(e.toString()));
      }
    });
  }
}
