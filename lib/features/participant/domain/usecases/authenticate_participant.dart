import 'package:injectable/injectable.dart';
import '../entities/participant_auth.dart';
import '../repositories/participant_repository.dart';

@lazySingleton
class AuthenticateParticipant {
  final ParticipantRepository _repository;

  AuthenticateParticipant(this._repository);

  Future<ParticipantAuth> call({
    required String dni,
    required String idEvento,
    required String idOrg,
    required String token,
  }) {
    return _repository.authParticipant(
      dni: dni,
      idEvento: idEvento,
      idOrg: idOrg,
      token: token,
    );
  }
}
