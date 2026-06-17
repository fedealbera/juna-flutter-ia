import 'package:injectable/injectable.dart';
import '../../../participant/data/datasource/participant_remote_datasource.dart';
import '../../../participant/data/dto/request/update_push_token_request_dto.dart';
import '../../domain/entities/push_token_result.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../mappers/notifications_mapper.dart';

@LazySingleton(as: NotificationsRepository)
class NotificationsRepositoryImpl implements NotificationsRepository {
  final ParticipantRemoteDataSource _remoteDataSource;

  NotificationsRepositoryImpl(this._remoteDataSource);

  @override
  Future<PushTokenResult> registerFirebaseToken({
    required String documento,
    required String idEvento,
    required String idOrg,
    required String token,
  }) async {
    final response = await _remoteDataSource.updatePushToken(
      UpdatePushTokenRequestDto(
        documento: documento,
        idEvento: idEvento,
        idOrg: idOrg,
        token: token,
      ),
    );
    return NotificationsMapper.toEntity(response);
  }
}
