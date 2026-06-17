import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_participant_request_dto.freezed.dart';
part 'auth_participant_request_dto.g.dart';

@freezed
class AuthParticipantRequestDto with _$AuthParticipantRequestDto {
  const factory AuthParticipantRequestDto({
    @JsonKey(name: 'dni') String? dni,
    @JsonKey(name: 'idEvento') String? idEvento,
    @JsonKey(name: 'idOrg') String? idOrg,
    @JsonKey(name: 'token') String? token,
  }) = _AuthParticipantRequestDto;

  factory AuthParticipantRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AuthParticipantRequestDtoFromJson(json);
}
