import 'package:injectable/injectable.dart';
import '../../../../core/network/dio_client.dart';
import '../dto/runner_dto.dart';
import 'mock_runners_data_source.dart';

abstract class RunnersRemoteDataSource {
  Future<List<RunnerDto>> getRunnersList(String eventId, String idOrg);
}

@LazySingleton(as: RunnersRemoteDataSource)
class RunnersRemoteDataSourceImpl implements RunnersRemoteDataSource {
  final DioClient _dioClient;

  RunnersRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<RunnerDto>> getRunnersList(String eventId, String idOrg) async {
    try {
      final response = await _dioClient.dio.get(
        '/eventos/$eventId/corredores',
        queryParameters: {'idOrg': idOrg},
      );

      final data = response.data;
      List<dynamic> items = [];
      if (data is List) {
        items = data;
      } else if (data is Map) {
        items = data['corredores'] ?? data['data'] ?? data['items'] ?? [];
      }

      if (items.isEmpty) {
        return MockRunnersDataSource.getMockRunners();
      }

      return items
          .whereType<Map<String, dynamic>>()
          .map((json) => RunnerDto.fromJson(json))
          .toList();
    } catch (_) {
      // Graceful fallback to realistic mock data while the backend endpoint is pending deployment
      return MockRunnersDataSource.getMockRunners();
    }
  }
}
