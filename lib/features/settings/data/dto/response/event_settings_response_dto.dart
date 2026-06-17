import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_settings_response_dto.freezed.dart';
part 'event_settings_response_dto.g.dart';

@freezed
class EventSettingsResponseDto with _$EventSettingsResponseDto {
  const factory EventSettingsResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _EventSettingsResponseDto;

  factory EventSettingsResponseDto.fromJson(Map<String, dynamic> json) =>
      EventSettingsResponseDto(rawJson: json);
}
