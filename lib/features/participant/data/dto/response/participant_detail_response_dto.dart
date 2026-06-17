import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant_detail_response_dto.freezed.dart';
part 'participant_detail_response_dto.g.dart';

@freezed
class ParticipantDetailResponseDto with _$ParticipantDetailResponseDto {
  const factory ParticipantDetailResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _ParticipantDetailResponseDto;

  factory ParticipantDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      ParticipantDetailResponseDto(rawJson: json);
}
