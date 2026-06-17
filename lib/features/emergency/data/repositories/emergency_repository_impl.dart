import 'package:injectable/injectable.dart';
import '../../domain/entities/sos_result.dart';
import '../../domain/repositories/emergency_repository.dart';
import '../datasource/emergency_remote_datasource.dart';
import '../dto/request/send_sos_request_dto.dart';
import '../mappers/emergency_mapper.dart';

@LazySingleton(as: EmergencyRepository)
class EmergencyRepositoryImpl implements EmergencyRepository {
  final EmergencyRemoteDataSource _remoteDataSource;

  EmergencyRepositoryImpl(this._remoteDataSource);

  @override
  Future<SosResult> sendSos({
    required String partiId,
    required String eventoId,
    required String orgId,
    required String latitud,
    required String longitud,
  }) async {
    final response = await _remoteDataSource.sendSos(
      SendSosRequestDto(
        partiId: partiId,
        eventoId: eventoId,
        orgId: orgId,
        latitud: latitud,
        longitud: longitud,
      ),
    );
    return EmergencyMapper.toEntity(response);
  }
}
