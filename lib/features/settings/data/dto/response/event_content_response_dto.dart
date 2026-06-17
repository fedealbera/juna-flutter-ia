import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_content_response_dto.freezed.dart';
part 'event_content_response_dto.g.dart';

@freezed
class EventContentResponseDto with _$EventContentResponseDto {
  const factory EventContentResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _EventContentResponseDto;

  factory EventContentResponseDto.fromJson(Map<String, dynamic> json) =>
      EventContentResponseDto(rawJson: json);
}
