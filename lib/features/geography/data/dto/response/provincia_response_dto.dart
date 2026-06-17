import 'package:freezed_annotation/freezed_annotation.dart';

part 'provincia_response_dto.freezed.dart';
part 'provincia_response_dto.g.dart';

@freezed
class ProvinciaResponseDto with _$ProvinciaResponseDto {
  const factory ProvinciaResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _ProvinciaResponseDto;

  factory ProvinciaResponseDto.fromJson(Map<String, dynamic> json) =>
      ProvinciaResponseDto(rawJson: json);
}
