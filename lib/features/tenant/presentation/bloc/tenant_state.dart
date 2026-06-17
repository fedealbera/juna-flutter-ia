import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/tenant_entity.dart';

part 'tenant_state.freezed.dart';

@freezed
class TenantState with _$TenantState {
  const factory TenantState.initial() = TenantInitial;
  const factory TenantState.loading() = TenantLoading;
  const factory TenantState.loaded(TenantEntity tenant) = TenantLoaded;
  const factory TenantState.error(String message) = TenantError;
}
