import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_circuito_response_dto.freezed.dart';
part 'update_circuito_response_dto.g.dart';

@freezed
class UpdateCircuitoResponseDto with _$UpdateCircuitoResponseDto {
  const factory UpdateCircuitoResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _UpdateCircuitoResponseDto;

  factory UpdateCircuitoResponseDto.fromJson(Map<String, dynamic> json) =>
      UpdateCircuitoResponseDto(rawJson: json);
}
