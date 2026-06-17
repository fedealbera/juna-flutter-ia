import '../../../participant/data/dto/response/update_push_token_response_dto.dart';
import '../../domain/entities/push_token_result.dart';

class NotificationsMapper {
  static PushTokenResult toEntity(UpdatePushTokenResponseDto dto) {
    return PushTokenResult(dto.rawJson);
  }
}
