import 'package:injectable/injectable.dart';
import '../api/emergency_api_service.dart';
import '../dto/request/send_sos_request_dto.dart';
import '../dto/response/send_sos_response_dto.dart';

abstract class EmergencyRemoteDataSource {
  Future<SendSosResponseDto> sendSos(SendSosRequestDto body);
}

@LazySingleton(as: EmergencyRemoteDataSource)
class EmergencyRemoteDataSourceImpl implements EmergencyRemoteDataSource {
  final EmergencyApiService _apiService;

  EmergencyRemoteDataSourceImpl(this._apiService);

  @override
  Future<SendSosResponseDto> sendSos(SendSosRequestDto body) {
    return _apiService.sendSos(body);
  }
}
