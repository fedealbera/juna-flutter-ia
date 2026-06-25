import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_participant_response_dto.freezed.dart';
part 'update_participant_response_dto.g.dart';

@freezed
class UpdateParticipantResponseDto with _$UpdateParticipantResponseDto {
  const factory UpdateParticipantResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _UpdateParticipantResponseDto;

  factory UpdateParticipantResponseDto.fromJson(Map<String, dynamic> json) =>
      UpdateParticipantResponseDto(rawJson: json);
}
