import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_circuito_request_dto.freezed.dart';
part 'update_circuito_request_dto.g.dart';

@freezed
class UpdateCircuitoRequestDto with _$UpdateCircuitoRequestDto {
  const factory UpdateCircuitoRequestDto({
    @JsonKey(name: 'insId') String? insId,
    @JsonKey(name: 'circuitoId') String? circuitoId,
    @JsonKey(name: 'categoriaId') String? categoriaId,
    @JsonKey(name: 'talleId') String? talleId,
  }) = _UpdateCircuitoRequestDto;

  factory UpdateCircuitoRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateCircuitoRequestDtoFromJson(json);
}
