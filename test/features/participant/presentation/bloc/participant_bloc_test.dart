import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:event_platform_v3/features/participant/domain/usecases/authenticate_participant.dart';
import 'package:event_platform_v3/features/participant/domain/usecases/get_participant_detail.dart';
import 'package:event_platform_v3/features/participant/domain/usecases/update_circuito.dart';
import 'package:event_platform_v3/features/participant/domain/usecases/update_contact.dart';
import 'package:event_platform_v3/features/participant/domain/usecases/update_emergency.dart';
import 'package:event_platform_v3/features/participant/domain/usecases/update_participant.dart';
import 'package:event_platform_v3/features/participant/domain/entities/participant_auth.dart';
import 'package:event_platform_v3/features/participant/domain/entities/participant_detail.dart';
import 'package:event_platform_v3/features/participant/presentation/bloc/participant_bloc.dart';
import 'package:event_platform_v3/features/participant/presentation/bloc/participant_event.dart';
import 'package:event_platform_v3/features/participant/presentation/bloc/participant_state.dart';

class MockAuthenticateParticipant extends Mock implements AuthenticateParticipant {}
class MockGetParticipantDetail extends Mock implements GetParticipantDetail {}
class MockUpdateCircuito extends Mock implements UpdateCircuito {}
class MockUpdateContact extends Mock implements UpdateContact {}
class MockUpdateEmergency extends Mock implements UpdateEmergency {}
class MockUpdateParticipant extends Mock implements UpdateParticipant {}

void main() {
  late MockAuthenticateParticipant mockAuthenticateParticipant;
  late MockGetParticipantDetail mockGetParticipantDetail;
  late MockUpdateCircuito mockUpdateCircuito;
  late MockUpdateContact mockUpdateContact;
  late MockUpdateEmergency mockUpdateEmergency;
  late MockUpdateParticipant mockUpdateParticipant;
  late ParticipantBloc bloc;

  setUp(() {
    mockAuthenticateParticipant = MockAuthenticateParticipant();
    mockGetParticipantDetail = MockGetParticipantDetail();
    mockUpdateCircuito = MockUpdateCircuito();
    mockUpdateContact = MockUpdateContact();
    mockUpdateEmergency = MockUpdateEmergency();
    mockUpdateParticipant = MockUpdateParticipant();
    bloc = ParticipantBloc(
      mockAuthenticateParticipant,
      mockGetParticipantDetail,
      mockUpdateEmergency,
      mockUpdateContact,
      mockUpdateCircuito,
      mockUpdateParticipant,
    );
  });

  tearDown(() {
    bloc.close();
  });

  group('ParticipantBloc', () {
    blocTest<ParticipantBloc, ParticipantState>(
      'emits [loading, authenticated] when Authenticate is added successfully',
      build: () {
        when(() => mockAuthenticateParticipant(
              dni: '123',
              idEvento: '1',
              idOrg: '1',
              token: 'tok',
            )).thenAnswer((_) async => const ParticipantAuth({'token': 'jwt'}));
        return bloc;
      },
      act: (bloc) => bloc.add(const ParticipantEvent.authenticate(
        dni: '123',
        idEvento: '1',
        idOrg: '1',
        token: 'tok',
      )),
      expect: () => [
        const ParticipantState.loading(),
        const ParticipantState.authenticated(ParticipantAuth({'token': 'jwt'})),
      ],
    );

    blocTest<ParticipantBloc, ParticipantState>(
      'emits [loading, detailLoaded] when GetDetail is added successfully',
      build: () {
        when(() => mockGetParticipantDetail(
              dni: '123',
              idOrg: '1',
              eventoId: '1',
              roundId: null,
            )).thenAnswer((_) async => const ParticipantDetail({'id': 'parti_1'}));
        return bloc;
      },
      act: (bloc) => bloc.add(const ParticipantEvent.getDetail(
        dni: '123',
        idOrg: '1',
        eventoId: '1',
      )),
      expect: () => [
        const ParticipantState.loading(),
        const ParticipantState.detailLoaded(ParticipantDetail({'id': 'parti_1'})),
      ],
    );
  });
}
