import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_event.freezed.dart';

@freezed
class RegistrationEvent with _$RegistrationEvent {
  const factory RegistrationEvent.validateDiscount({
    required String insId,
    required String code,
  }) = ValidateDiscountEvent;
}
