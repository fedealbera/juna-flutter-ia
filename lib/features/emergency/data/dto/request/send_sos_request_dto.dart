import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_sos_request_dto.freezed.dart';
part 'send_sos_request_dto.g.dart';

@freezed
class SendSosRequestDto with _$SendSosRequestDto {
  const factory SendSosRequestDto({
    @JsonKey(name: 'parti_id') String? partiId,
    @JsonKey(name: 'evento_id') String? eventoId,
    @JsonKey(name: 'org_id') String? orgId,
    @JsonKey(name: 'latitud') String? latitud,
    @JsonKey(name: 'longitud') String? longitud,
  }) = _SendSosRequestDto;

  factory SendSosRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SendSosRequestDtoFromJson(json);
}
