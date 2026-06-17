import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_contact_request_dto.freezed.dart';
part 'update_contact_request_dto.g.dart';

@freezed
class UpdateContactRequestDto with _$UpdateContactRequestDto {
  const factory UpdateContactRequestDto({
    @JsonKey(name: 'domCiudad') String? domCiudad,
    @JsonKey(name: 'domCiudadNombre') String? domCiudadNombre,
    @JsonKey(name: 'domProvincia') String? domProvincia,
    @JsonKey(name: 'domPais') String? domPais,
    @JsonKey(name: 'contInstagram') String? contInstagram,
    @JsonKey(name: 'contCelular') String? contCelular,
    @JsonKey(name: 'contEmail') String? contEmail,
  }) = _UpdateContactRequestDto;

  factory UpdateContactRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateContactRequestDtoFromJson(json);
}
