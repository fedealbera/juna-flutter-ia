import 'package:injectable/injectable.dart';
import '../entities/tenant_entity.dart';
import '../repositories/tenant_repository.dart';

@lazySingleton
class ChangeTenant {
  final TenantRepository _repository;

  ChangeTenant(this._repository);

  Future<void> call(TenantEntity tenant) {
    return _repository.changeTenant(tenant);
  }
}
