import 'package:injectable/injectable.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../domain/entities/tenant_entity.dart';
import '../../domain/repositories/tenant_repository.dart';
import '../mappers/tenant_mapper.dart';

@LazySingleton(as: TenantRepository)
class TenantRepositoryImpl implements TenantRepository {
  final TenantManager _tenantManager;

  TenantRepositoryImpl(this._tenantManager);

  @override
  Future<TenantEntity> getActiveTenant() async {
    return TenantMapper.toEntity(_tenantManager.value);
  }

  @override
  Future<void> changeTenant(TenantEntity tenant) async {
    final config = TenantMapper.toConfig(tenant);
    await _tenantManager.changeTenant(config);
  }
}
