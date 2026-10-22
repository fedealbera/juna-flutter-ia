import 'package:event_platform_v3/features/runners/data/datasources/mock_runners_data_source.dart';
import 'package:event_platform_v3/features/runners/data/dto/runner_dto.dart';
import 'package:event_platform_v3/features/runners/domain/entities/runner_item.dart';
import 'package:event_platform_v3/features/runners/domain/repositories/runners_repository.dart';
import 'package:event_platform_v3/features/runners/presentation/bloc/runners_bloc.dart';
import 'package:event_platform_v3/features/runners/presentation/bloc/runners_event.dart';
import 'package:event_platform_v3/features/runners/presentation/bloc/runners_state.dart';
import 'package:flutter_test/flutter_test.dart';

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
}
