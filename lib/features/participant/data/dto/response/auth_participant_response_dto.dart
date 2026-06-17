import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_participant_response_dto.freezed.dart';
part 'auth_participant_response_dto.g.dart';

@freezed
class AuthParticipantResponseDto with _$AuthParticipantResponseDto {
  const factory AuthParticipantResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _AuthParticipantResponseDto;

  factory AuthParticipantResponseDto.fromJson(Map<String, dynamic> json) =>
      AuthParticipantResponseDto(rawJson: json);
}
