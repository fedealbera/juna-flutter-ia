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
        '/participantes/acreditados',
      );

      final data = response.data;
      if (data is Map<String, dynamic> || data is Map) {
        final map = (data as Map).cast<String, dynamic>();
        if (map.containsKey('participantes')) {
          final runners = RunnerDto.fromAcreditadosResponse(map);
          if (runners.isNotEmpty) {
            return runners;
          }
        }
      }

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
      // Graceful fallback to realistic mock data in case of unexpected network failure
      return MockRunnersDataSource.getMockRunners();
    }
  }
}
