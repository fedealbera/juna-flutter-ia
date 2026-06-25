import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_participant_request_dto.freezed.dart';
part 'update_participant_request_dto.g.dart';

@freezed
class UpdateParticipantRequestDto with _$UpdateParticipantRequestDto {
  const factory UpdateParticipantRequestDto({
    @JsonKey(name: 'contNombre') String? contNombre,
    @JsonKey(name: 'contTel') String? contTel,
    @JsonKey(name: 'domCiudad') String? domCiudad,
    @JsonKey(name: 'domCiudadNombre') String? domCiudadNombre,
    @JsonKey(name: 'domProvincia') String? domProvincia,
    @JsonKey(name: 'domPais') String? domPais,
    @JsonKey(name: 'contInstagram') String? contInstagram,
    @JsonKey(name: 'contCelular') String? contCelular,
    @JsonKey(name: 'contEmail') String? contEmail,
    @JsonKey(name: 'insId') String? insId,
    @JsonKey(name: 'circuitoId') String? circuitoId,
    @JsonKey(name: 'categoriaId') String? categoriaId,
    @JsonKey(name: 'talleId') String? talleId,
  }) = _UpdateParticipantRequestDto;

  factory UpdateParticipantRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateParticipantRequestDtoFromJson(json);
}
