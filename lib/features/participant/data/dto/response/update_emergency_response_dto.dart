import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_emergency_response_dto.freezed.dart';
part 'update_emergency_response_dto.g.dart';

@freezed
class UpdateEmergencyResponseDto with _$UpdateEmergencyResponseDto {
  const factory UpdateEmergencyResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _UpdateEmergencyResponseDto;

  factory UpdateEmergencyResponseDto.fromJson(Map<String, dynamic> json) =>
      UpdateEmergencyResponseDto(rawJson: json);
}
