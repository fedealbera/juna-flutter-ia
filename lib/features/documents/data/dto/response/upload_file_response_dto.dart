import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_file_response_dto.freezed.dart';
part 'upload_file_response_dto.g.dart';

@freezed
class UploadFileResponseDto with _$UploadFileResponseDto {
  const factory UploadFileResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _UploadFileResponseDto;

  factory UploadFileResponseDto.fromJson(Map<String, dynamic> json) =>
      UploadFileResponseDto(rawJson: json);
}
