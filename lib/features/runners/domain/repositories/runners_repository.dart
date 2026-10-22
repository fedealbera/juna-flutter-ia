import '../entities/runner_item.dart';

abstract class RunnersRepository {
  Future<List<RunnerItem>> getRunnersList({
    required String eventId,
    required String orgId,
  });
}
