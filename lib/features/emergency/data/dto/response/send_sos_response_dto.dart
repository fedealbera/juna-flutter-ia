import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_sos_response_dto.freezed.dart';
part 'send_sos_response_dto.g.dart';

@freezed
class SendSosResponseDto with _$SendSosResponseDto {
  const factory SendSosResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _SendSosResponseDto;

  factory SendSosResponseDto.fromJson(Map<String, dynamic> json) =>
      SendSosResponseDto(rawJson: json);
}
