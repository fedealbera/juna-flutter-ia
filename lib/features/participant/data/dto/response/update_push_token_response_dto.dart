import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_push_token_response_dto.freezed.dart';
part 'update_push_token_response_dto.g.dart';

@freezed
class UpdatePushTokenResponseDto with _$UpdatePushTokenResponseDto {
  const factory UpdatePushTokenResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _UpdatePushTokenResponseDto;

  factory UpdatePushTokenResponseDto.fromJson(Map<String, dynamic> json) =>
      UpdatePushTokenResponseDto(rawJson: json);
}
