import '../../../../core/theme/tenant_config.dart';
import '../../domain/entities/tenant_entity.dart';

class TenantMapper {
  static TenantEntity toEntity(TenantConfig config) {
    return TenantEntity(
      tenantId: config.tenantId,
      tenantName: config.tenantName,
      logoUrl: config.logoUrl,
      primaryColor: config.primaryColor,
      secondaryColor: config.secondaryColor,
      accentColor: config.accentColor,
      firebase: config.firebase,
      featureFlags: config.featureFlags,
      baseUrl: config.baseUrl,
      supportedSports: config.supportedSports.map((e) => e.name).toList(),
    );
  }

  static TenantConfig toConfig(TenantEntity entity) {
    return TenantConfig(
      tenantId: entity.tenantId,
      tenantName: entity.tenantName,
      logoUrl: entity.logoUrl,
      primaryColor: entity.primaryColor,
      secondaryColor: entity.secondaryColor,
      accentColor: entity.accentColor,
      firebase: entity.firebase,
      featureFlags: entity.featureFlags,
      baseUrl: entity.baseUrl,
      supportedSports: entity.supportedSports.map((e) {
        return SportType.values.firstWhere(
          (s) => s.name == e,
          orElse: () => SportType.running,
        );
      }).toList(),
    );
  }
}
