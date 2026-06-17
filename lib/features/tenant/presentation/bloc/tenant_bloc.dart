import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_active_tenant.dart';
import '../../domain/usecases/change_tenant.dart';
import 'tenant_event.dart';
import 'tenant_state.dart';

@injectable
class TenantBloc extends Bloc<TenantEvent, TenantState> {
  final GetActiveTenant _getActiveTenant;
  final ChangeTenant _changeTenant;

  TenantBloc(
    this._getActiveTenant,
    this._changeTenant,
  ) : super(const TenantState.initial()) {
    on<LoadActiveTenant>((event, emit) async {
      emit(const TenantState.loading());
      try {
        final tenant = await _getActiveTenant();
        emit(TenantState.loaded(tenant));
      } catch (e) {
        emit(TenantState.error(e.toString()));
      }
    });

    on<SwitchTenant>((event, emit) async {
      emit(const TenantState.loading());
      try {
        await _changeTenant(event.tenant);
        emit(TenantState.loaded(event.tenant));
      } catch (e) {
        emit(TenantState.error(e.toString()));
      }
    });
  }
}
