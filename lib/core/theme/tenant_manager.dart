import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../firebase/active_tenant_config.dart';
import 'tenant_config.dart';

@lazySingleton
class TenantManager extends ValueNotifier<TenantConfig> {
  TenantManager() : super(ActiveTenantConfig.get());

  // In a real application, tenant configurations could be resolved
  // from custom subdomains, package configurations, or initial API calls.
  Future<void> init() async {
    // Load default or cached tenant
    final cachedTenant = await _loadCachedTenant();
    if (cachedTenant != null) {
      value = cachedTenant;
    }
  }

  Future<void> changeTenant(TenantConfig newConfig) async {
    value = newConfig;
    await _cacheTenant(newConfig);
  }

  Future<TenantConfig?> _loadCachedTenant() async {
    // Stub for caching logic using Hive or SecureStorage
    return null;
  }

  Future<void> _cacheTenant(TenantConfig config) async {
    // Stub for saving tenant configuration locally
  }
}
