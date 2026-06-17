import 'package:freezed_annotation/freezed_annotation.dart';

part 'categoria_response_dto.freezed.dart';
part 'categoria_response_dto.g.dart';

@freezed
class CategoriaResponseDto with _$CategoriaResponseDto {
  const factory CategoriaResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _CategoriaResponseDto;

  factory CategoriaResponseDto.fromJson(Map<String, dynamic> json) =>
      CategoriaResponseDto(rawJson: json);
}
