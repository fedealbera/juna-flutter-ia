import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_emergency_request_dto.freezed.dart';
part 'update_emergency_request_dto.g.dart';

@freezed
class UpdateEmergencyRequestDto with _$UpdateEmergencyRequestDto {
  const factory UpdateEmergencyRequestDto({
    @JsonKey(name: 'contNombre') String? contNombre,
    @JsonKey(name: 'contTel') String? contTel,
  }) = _UpdateEmergencyRequestDto;

  factory UpdateEmergencyRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmergencyRequestDtoFromJson(json);
}
