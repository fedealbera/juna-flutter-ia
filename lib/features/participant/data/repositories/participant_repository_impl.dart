import 'package:injectable/injectable.dart';
import '../../domain/entities/participant_auth.dart';
import '../../domain/entities/participant_detail.dart';
import '../../domain/entities/update_circuito_entity.dart';
import '../../domain/entities/update_contact_entity.dart';
import '../../domain/entities/update_emergency_entity.dart';
import '../../domain/repositories/participant_repository.dart';
import '../datasource/participant_remote_datasource.dart';
import '../dto/request/auth_participant_request_dto.dart';
import '../dto/request/update_circuito_request_dto.dart';
import '../dto/request/update_contact_request_dto.dart';
import '../dto/request/update_emergency_request_dto.dart';
import '../mappers/participant_mapper.dart';

@LazySingleton(as: ParticipantRepository)
class ParticipantRepositoryImpl implements ParticipantRepository {
  final ParticipantRemoteDataSource _remoteDataSource;

  ParticipantRepositoryImpl(this._remoteDataSource);

  @override
  Future<ParticipantAuth> authParticipant({
    required String dni,
    required String idEvento,
    required String idOrg,
    required String token,
  }) async {
    final response = await _remoteDataSource.authParticipant(
      AuthParticipantRequestDto(
        dni: dni,
        idEvento: idEvento,
        idOrg: idOrg,
        token: token,
      ),
    );
    return ParticipantMapper.toAuthEntity(response);
  }

  @override
  Future<ParticipantDetail> getParticipantDetail({
    required String dni,
    required String idOrg,
    required String eventoId,
    String? roundId,
  }) async {
    final response = await _remoteDataSource.getParticipantDetail(
      dni,
      idOrg,
      eventoId,
      roundId,
    );
    return ParticipantMapper.toDetailEntity(response);
  }

  @override
  Future<UpdateEmergencyEntity> updateEmergency({
    required String partiId,
    required String contNombre,
    required String contTel,
  }) async {
    final response = await _remoteDataSource.updateEmergency(
      partiId,
      UpdateEmergencyRequestDto(
        contNombre: contNombre,
        contTel: contTel,
      ),
    );
    return ParticipantMapper.toEmergencyEntity(response);
  }

  @override
  Future<UpdateContactEntity> updateContact({
    required String partiId,
    String? domCiudad,
    String? domCiudadNombre,
    String? domProvincia,
    String? domPais,
    String? contInstagram,
    String? contCelular,
    String? contEmail,
  }) async {
    final response = await _remoteDataSource.updateContact(
      partiId,
      UpdateContactRequestDto(
        domCiudad: domCiudad,
        domCiudadNombre: domCiudadNombre,
        domProvincia: domProvincia,
        domPais: domPais,
        contInstagram: contInstagram,
        contCelular: contCelular,
        contEmail: contEmail,
      ),
    );
    return ParticipantMapper.toContactEntity(response);
  }

  @override
  Future<UpdateCircuitoEntity> updateCircuito({
    required String partiId,
    required String insId,
    required String circuitoId,
    required String categoriaId,
    required String talleId,
  }) async {
    final response = await _remoteDataSource.updateCircuito(
      partiId,
      UpdateCircuitoRequestDto(
        insId: insId,
        circuitoId: circuitoId,
        categoriaId: categoriaId,
        talleId: talleId,
      ),
    );
    return ParticipantMapper.toCircuitoEntity(response);
  }
}
