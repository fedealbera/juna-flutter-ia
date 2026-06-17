import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_contact_response_dto.freezed.dart';
part 'update_contact_response_dto.g.dart';

@freezed
class UpdateContactResponseDto with _$UpdateContactResponseDto {
  const factory UpdateContactResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _UpdateContactResponseDto;

  factory UpdateContactResponseDto.fromJson(Map<String, dynamic> json) =>
      UpdateContactResponseDto(rawJson: json);
}
