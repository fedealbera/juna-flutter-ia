import 'package:injectable/injectable.dart';
import '../entities/push_token_result.dart';
import '../repositories/notifications_repository.dart';

@lazySingleton
class RegisterFirebaseToken {
  final NotificationsRepository _repository;

  RegisterFirebaseToken(this._repository);

  Future<PushTokenResult> call({
    required String documento,
    required String idEvento,
    required String idOrg,
    required String token,
  }) {
    return _repository.registerFirebaseToken(
      documento: documento,
      idEvento: idEvento,
      idOrg: idOrg,
      token: token,
    );
  }
}
