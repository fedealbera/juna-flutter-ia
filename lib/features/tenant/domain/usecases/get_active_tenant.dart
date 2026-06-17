import 'package:injectable/injectable.dart';
import '../entities/tenant_entity.dart';
import '../repositories/tenant_repository.dart';

@lazySingleton
class GetActiveTenant {
  final TenantRepository _repository;

  GetActiveTenant(this._repository);

  Future<TenantEntity> call() {
    return _repository.getActiveTenant();
  }
}
