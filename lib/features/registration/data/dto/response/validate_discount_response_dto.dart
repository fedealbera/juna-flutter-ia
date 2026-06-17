import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_discount_response_dto.freezed.dart';
part 'validate_discount_response_dto.g.dart';

@freezed
class ValidateDiscountResponseDto with _$ValidateDiscountResponseDto {
  const factory ValidateDiscountResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _ValidateDiscountResponseDto;

  factory ValidateDiscountResponseDto.fromJson(Map<String, dynamic> json) =>
      ValidateDiscountResponseDto(rawJson: json);
}
