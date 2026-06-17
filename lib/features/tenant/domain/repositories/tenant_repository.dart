import '../../domain/entities/tenant_entity.dart';

abstract class TenantRepository {
  Future<TenantEntity> getActiveTenant();
  Future<void> changeTenant(TenantEntity tenant);
}
