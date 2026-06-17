import '../../../../core/theme/tenant_config.dart';
import '../../domain/entities/tenant_entity.dart';

class TenantMapper {
  static TenantEntity toEntity(TenantConfig config) {
    return TenantEntity(
      id: config.id,
      name: config.name,
      primaryColor: config.primaryColor,
      secondaryColor: config.secondaryColor,
      accentColor: config.accentColor,
      backgroundColor: config.backgroundColor,
      logoUrl: config.logoUrl,
      supportedSports: config.supportedSports.map((e) => e.name).toList(),
      enableRegistration: config.enableRegistration,
      enableLiveTracking: config.enableLiveTracking,
    );
  }

  static TenantConfig toConfig(TenantEntity entity) {
    return TenantConfig(
      id: entity.id,
      name: entity.name,
      primaryColor: entity.primaryColor,
      secondaryColor: entity.secondaryColor,
      accentColor: entity.accentColor,
      backgroundColor: entity.backgroundColor,
      logoUrl: entity.logoUrl,
      supportedSports: entity.supportedSports.map((e) {
        return SportType.values.firstWhere(
          (s) => s.name == e,
          orElse: () => SportType.running,
        );
      }).toList(),
      enableRegistration: entity.enableRegistration,
      enableLiveTracking: entity.enableLiveTracking,
    );
  }
}
