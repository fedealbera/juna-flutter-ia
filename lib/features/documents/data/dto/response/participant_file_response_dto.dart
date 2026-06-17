import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant_file_response_dto.freezed.dart';
part 'participant_file_response_dto.g.dart';

@freezed
class ParticipantFileResponseDto with _$ParticipantFileResponseDto {
  const factory ParticipantFileResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _ParticipantFileResponseDto;

  factory ParticipantFileResponseDto.fromJson(Map<String, dynamic> json) =>
      ParticipantFileResponseDto(rawJson: json);
}
