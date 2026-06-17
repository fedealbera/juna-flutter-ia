import 'package:freezed_annotation/freezed_annotation.dart';

part 'ciudad_response_dto.freezed.dart';
part 'ciudad_response_dto.g.dart';

@freezed
class CiudadResponseDto with _$CiudadResponseDto {
  const factory CiudadResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _CiudadResponseDto;

  factory CiudadResponseDto.fromJson(Map<String, dynamic> json) =>
      CiudadResponseDto(rawJson: json);
}
