import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_discount_request_dto.freezed.dart';
part 'validate_discount_request_dto.g.dart';

@freezed
class ValidateDiscountRequestDto with _$ValidateDiscountRequestDto {
  const factory ValidateDiscountRequestDto({
    @JsonKey(name: 'cod') String? cod,
  }) = _ValidateDiscountRequestDto;

  factory ValidateDiscountRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ValidateDiscountRequestDtoFromJson(json);
}
