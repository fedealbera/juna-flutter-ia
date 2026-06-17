import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/discount_result.dart';

part 'registration_state.freezed.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial() = RegistrationInitial;
  const factory RegistrationState.loading() = RegistrationLoading;
  const factory RegistrationState.discountValidated(DiscountResult result) = RegistrationDiscountValidated;
  const factory RegistrationState.error(String message) = RegistrationError;
}
