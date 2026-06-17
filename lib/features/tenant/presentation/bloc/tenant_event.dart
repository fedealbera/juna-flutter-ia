import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/tenant_entity.dart';

part 'tenant_event.freezed.dart';

@freezed
class TenantEvent with _$TenantEvent {
  const factory TenantEvent.loadActiveTenant() = LoadActiveTenant;
  const factory TenantEvent.switchTenant(TenantEntity tenant) = SwitchTenant;
}
