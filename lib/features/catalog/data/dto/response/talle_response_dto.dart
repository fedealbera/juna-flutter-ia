import 'package:freezed_annotation/freezed_annotation.dart';

part 'talle_response_dto.freezed.dart';
part 'talle_response_dto.g.dart';

@freezed
class TalleResponseDto with _$TalleResponseDto {
  const factory TalleResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _TalleResponseDto;

  factory TalleResponseDto.fromJson(Map<String, dynamic> json) =>
      TalleResponseDto(rawJson: json);
}
