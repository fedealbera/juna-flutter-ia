import '../entities/push_token_result.dart';

abstract class NotificationsRepository {
  Future<PushTokenResult> registerFirebaseToken({
    required String documento,
    required String idEvento,
    required String idOrg,
    required String token,
  });
}
