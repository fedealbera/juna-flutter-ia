import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:event_platform_v3/core/firebase/active_tenant_config.dart';
import 'package:event_platform_v3/features/runners/data/datasources/mock_runners_data_source.dart';
import 'package:event_platform_v3/features/runners/data/dto/runner_dto.dart';
import 'package:event_platform_v3/features/runners/domain/entities/runner_item.dart';
import 'package:event_platform_v3/features/runners/domain/repositories/runners_repository.dart';
import 'package:event_platform_v3/features/runners/presentation/bloc/runners_bloc.dart';
import 'package:event_platform_v3/features/runners/presentation/bloc/runners_event.dart';
import 'package:event_platform_v3/features/runners/presentation/bloc/runners_state.dart';
import 'package:event_platform_v3/features/runners/presentation/widgets/runner_card.dart';

class FakeRunnersRepository implements RunnersRepository {
  final List<RunnerItem> runners;
  final bool shouldFail;

  FakeRunnersRepository({required this.runners, this.shouldFail = false});

  @override
  Future<List<RunnerItem>> getRunnersList({
    required String eventId,
    required String orgId,
  }) async {
    if (shouldFail) {
      throw Exception('Server error');
    }
    return runners;
  }
}

void main() {
  group('RunnerDto & RunnerItem', () {
    test('parses json correctly and converts to entity', () {
      final json = {
        'id': '99',
        'nombre': 'Juan',
        'apellido': 'Pérez',
        'dorsal': '450',
        'circuito': '21K',
        'categoria': 'Caballeros 30-34',
        'ciudad': 'Tucumán',
        'provincia': 'Tucumán',
        'grupo_entrenamiento': 'Team Alpha',
      };

      final dto = RunnerDto.fromJson(json);
      expect(dto.id, equals('99'));
      expect(dto.nombre, equals('Juan'));
      expect(dto.apellido, equals('Pérez'));
      expect(dto.dorsal, equals('450'));
      expect(dto.circuito, equals('21K'));
      expect(dto.categoria, equals('Caballeros 30-34'));
      expect(dto.ciudad, equals('Tucumán'));
      expect(dto.grupoEntrenamiento, equals('Team Alpha'));

      final entity = dto.toEntity();
      expect(entity.fullName, equals('Juan Pérez'));
      expect(entity.hasDorsal, isTrue);
    });

    test('hasDorsal returns false when dorsal is empty or "0"', () {
      const runnerNoDorsal = RunnerItem(
        id: '1',
        nombre: 'A',
        apellido: 'B',
        dorsal: '0',
        circuito: '10K',
        categoria: 'General',
      );
      expect(runnerNoDorsal.hasDorsal, isFalse);

      const runnerEmptyDorsal = RunnerItem(
        id: '2',
        nombre: 'A',
        apellido: 'B',
        dorsal: '',
        circuito: '10K',
        categoria: 'General',
      );
      expect(runnerEmptyDorsal.hasDorsal, isFalse);
    });

    test('location returns correct formatted strings', () {
      const runnerBoth = RunnerItem(
        id: '1',
        nombre: 'A',
        apellido: 'B',
        dorsal: '',
        circuito: '10K',
        categoria: 'General',
        ciudad: 'Yerba Buena',
        provincia: 'Tucumán',
      );
      expect(runnerBoth.location, equals('Yerba Buena, Tucumán'));

      const runnerOnlyProv = RunnerItem(
        id: '2',
        nombre: 'A',
        apellido: 'B',
        dorsal: '',
        circuito: '10K',
        categoria: 'General',
        provincia: 'Tucumán',
      );
      expect(runnerOnlyProv.location, equals('Tucumán'));

      const runnerNone = RunnerItem(
        id: '3',
        nombre: 'A',
        apellido: 'B',
        dorsal: '',
        circuito: '10K',
        categoria: 'General',
      );
      expect(runnerNone.location, isEmpty);
    });

    test('fromAcreditadosResponse parses nested api structure into flat list', () {
      final json = {
        "participantes": {
          "F": {
            "5K": {
              "MUJERES 5K": [
                {"nombre": "NANCY", "apellido": "JUSTINIANO", "provincia": "TUCUMÁN"},
                {"nombre": "ROCIO GABRIELA", "apellido": "LOPEZ", "provincia": "TUCUMÁN"}
              ]
            }
          },
          "M": {
            "10K": {
              "HOMBRES 20-24": [
                {"nombre": "KIMI", "apellido": "ANTONELLI", "provincia": "CHUBUT"}
              ]
            }
          }
        },
        "total": 3,
        "error": null
      };

      final dtos = RunnerDto.fromAcreditadosResponse(json);
      expect(dtos.length, equals(3));

      final first = dtos[0];
      expect(first.nombre, equals('NANCY'));
      expect(first.apellido, equals('JUSTINIANO'));
      expect(first.circuito, equals('5K'));
      expect(first.categoria, equals('MUJERES 5K'));
      expect(first.provincia, equals('TUCUMÁN'));
      expect(first.sexo, equals('F'));

      final third = dtos[2];
      expect(third.nombre, equals('KIMI'));
      expect(third.apellido, equals('ANTONELLI'));
      expect(third.circuito, equals('10K'));
      expect(third.categoria, equals('HOMBRES 20-24'));
      expect(third.provincia, equals('CHUBUT'));
      expect(third.sexo, equals('M'));
    });

    test('initials returns uppercase two-letter initials correctly', () {
      const runner1 = RunnerItem(
        id: '1',
        nombre: 'Nancy',
        apellido: 'Justiniano',
        dorsal: '0',
        circuito: '5K',
        categoria: 'Mujeres 5K',
      );
      expect(runner1.initials, equals('NJ'));

      const runnerOnlyName = RunnerItem(
        id: '2',
        nombre: 'Kimi',
        apellido: '',
        dorsal: '0',
        circuito: '10K',
        categoria: 'Hombres',
      );
      expect(runnerOnlyName.initials, equals('KI'));

      const runnerOnlySurname = RunnerItem(
        id: '3',
        nombre: '',
        apellido: 'Lopez',
        dorsal: '0',
        circuito: '10K',
        categoria: 'Mujeres',
      );
      expect(runnerOnlySurname.initials, equals('LO'));

      const runnerEmpty = RunnerItem(
        id: '4',
        nombre: '',
        apellido: '',
        dorsal: '0',
        circuito: '10K',
        categoria: 'General',
      );
      expect(runnerEmpty.initials, equals('CO'));
    });
  });

  group('MockRunnersDataSource', () {
    test('returns non-empty list of runners with valid circuits and categories', () {
      final list = MockRunnersDataSource.getMockRunners();
      expect(list, isNotEmpty);
      expect(list.any((r) => r.circuito == '21K'), isTrue);
      expect(list.any((r) => r.circuito == '10K'), isTrue);
      expect(list.any((r) => r.circuito == '5K'), isTrue);
    });
  });

  group('RunnersBloc', () {
    test('emits [RunnersLoading, RunnersLoaded] on GetRunnersEvent success', () async {
      final fakeRunners = [
        const RunnerItem(
          id: '1',
          nombre: 'Mariana',
          apellido: 'Castillo',
          dorsal: '205',
          circuito: '21K',
          categoria: 'Damas 30-34',
        ),
      ];
      final repository = FakeRunnersRepository(runners: fakeRunners);
      final bloc = RunnersBloc(repository);

      expect(bloc.state, equals(const RunnersState.initial()));

      final expectedStates = [
        const RunnersState.loading(),
        RunnersState.loaded(runners: fakeRunners),
      ];

      expectLater(bloc.stream, emitsInOrder(expectedStates));

      bloc.add(const RunnersEvent.getRunners(eventId: '1', orgId: '1'));
    });

    test('emits [RunnersLoading, RunnersError] on GetRunnersEvent failure', () async {
      final repository = FakeRunnersRepository(runners: [], shouldFail: true);
      final bloc = RunnersBloc(repository);

      final expectedStates = [
        const RunnersState.loading(),
        const RunnersState.error('Exception: Server error'),
      ];

      expectLater(bloc.stream, emitsInOrder(expectedStates));

      bloc.add(const RunnersEvent.getRunners(eventId: '1', orgId: '1'));
    });
  });

  group('RunnerCard Widget', () {
    final tenant = ActiveTenantConfig.get();

    testWidgets('renders runner initials and accredited badge when no dorsal', (tester) async {
      const runner = RunnerItem(
        id: '1',
        nombre: 'Nancy',
        apellido: 'Justiniano',
        dorsal: '0',
        circuito: '5K',
        categoria: 'MUJERES 5K',
        provincia: 'Tucumán',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RunnerCard(runner: runner, tenant: tenant),
          ),
        ),
      );

      expect(find.text('NJ'), findsOneWidget);
      expect(find.text('Nancy Justiniano'), findsOneWidget);
      expect(find.text('5K'), findsOneWidget);
      expect(find.text('MUJERES 5K'), findsOneWidget);
      expect(find.text('Acreditado'), findsOneWidget);
      expect(find.byIcon(Icons.check_rounded), findsOneWidget);
    });

    testWidgets('renders dorsal box when runner has dorsal', (tester) async {
      const runner = RunnerItem(
        id: '2',
        nombre: 'Kimi',
        apellido: 'Antonelli',
        dorsal: '1042',
        circuito: '21K',
        categoria: 'HOMBRES 20-24',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RunnerCard(runner: runner, tenant: tenant),
          ),
        ),
      );

      expect(find.text('1042'), findsOneWidget);
      expect(find.text('DORSAL'), findsOneWidget);
      expect(find.text('21K'), findsOneWidget);
    });

    testWidgets('renders "TÚ" badge when isCurrentRunner is true', (tester) async {
      const runner = RunnerItem(
        id: '3',
        nombre: 'Mariana',
        apellido: 'Fernandez',
        dorsal: '55',
        circuito: '10K',
        categoria: 'MUJERES 20-24',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RunnerCard(runner: runner, tenant: tenant, isCurrentRunner: true),
          ),
        ),
      );

      expect(find.text('TÚ'), findsOneWidget);
    });
  });
}

