import 'package:freezed_annotation/freezed_annotation.dart';

part 'kit_authorization_request_dto.freezed.dart';
part 'kit_authorization_request_dto.g.dart';

@freezed
class KitAuthorizationRequestDto with _$KitAuthorizationRequestDto {
  const factory KitAuthorizationRequestDto({
    @JsonKey(name: 'dni') String? dni,
    @JsonKey(name: 'ins_id') int? insId,
    @JsonKey(name: 'idEvento') String? idEvento,
    @JsonKey(name: 'idOrg') String? idOrg,
    @JsonKey(name: 'autorizado_dni') required String autorizadoDni,
    @JsonKey(name: 'autorizado_nombre') required String autorizadoNombre,
  }) = _KitAuthorizationRequestDto;

  factory KitAuthorizationRequestDto.fromJson(Map<String, dynamic> json) =>
      _$KitAuthorizationRequestDtoFromJson(json);
}
