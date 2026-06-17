import 'package:freezed_annotation/freezed_annotation.dart';

part 'circuito_response_dto.freezed.dart';
part 'circuito_response_dto.g.dart';

@freezed
class CircuitoResponseDto with _$CircuitoResponseDto {
  const factory CircuitoResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _CircuitoResponseDto;

  factory CircuitoResponseDto.fromJson(Map<String, dynamic> json) =>
      CircuitoResponseDto(rawJson: json);
}
