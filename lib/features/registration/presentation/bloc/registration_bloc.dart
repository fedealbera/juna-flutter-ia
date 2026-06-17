import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/validate_discount.dart';
import 'registration_event.dart';
import 'registration_state.dart';

@injectable
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final ValidateDiscount _validateDiscount;

  RegistrationBloc(this._validateDiscount)
      : super(const RegistrationState.initial()) {
    on<ValidateDiscountEvent>((event, emit) async {
      emit(const RegistrationState.loading());
      try {
        final result = await _validateDiscount(
          insId: event.insId,
          code: event.code,
        );
        emit(RegistrationState.discountValidated(result));
      } catch (e) {
        emit(RegistrationState.error(e.toString()));
      }
    });
  }
}
