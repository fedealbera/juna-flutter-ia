import 'package:injectable/injectable.dart';
import '../../domain/entities/runner_item.dart';
import '../../domain/repositories/runners_repository.dart';
import '../datasources/runners_remote_data_source.dart';

@LazySingleton(as: RunnersRepository)
class RunnersRepositoryImpl implements RunnersRepository {
  final RunnersRemoteDataSource _remoteDataSource;

  RunnersRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<RunnerItem>> getRunnersList({
    required String eventId,
    required String orgId,
  }) async {
    final dtos = await _remoteDataSource.getRunnersList(eventId, orgId);
    return dtos.map((dto) => dto.toEntity()).toList();
  }
}
