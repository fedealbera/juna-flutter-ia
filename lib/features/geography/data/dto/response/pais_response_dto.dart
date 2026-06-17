import 'package:freezed_annotation/freezed_annotation.dart';

part 'pais_response_dto.freezed.dart';
part 'pais_response_dto.g.dart';

@freezed
class PaisResponseDto with _$PaisResponseDto {
  const factory PaisResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _PaisResponseDto;

  factory PaisResponseDto.fromJson(Map<String, dynamic> json) =>
      PaisResponseDto(rawJson: json);
}
