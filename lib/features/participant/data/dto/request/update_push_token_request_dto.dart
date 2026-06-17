import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_push_token_request_dto.freezed.dart';
part 'update_push_token_request_dto.g.dart';

@freezed
class UpdatePushTokenRequestDto with _$UpdatePushTokenRequestDto {
  const factory UpdatePushTokenRequestDto({
    @JsonKey(name: 'documento') String? documento,
    @JsonKey(name: 'idEvento') String? idEvento,
    @JsonKey(name: 'idOrg') String? idOrg,
    @JsonKey(name: 'token') String? token,
  }) = _UpdatePushTokenRequestDto;

  factory UpdatePushTokenRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePushTokenRequestDtoFromJson(json);
}
