import 'package:injectable/injectable.dart';
import 'package:event_platform_v3/core/theme/tenant_manager.dart';
import '../datasource/settings_remote_datasource.dart';
import '../../domain/entities/event_settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../mappers/event_settings_mapper.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteDataSource _settingsRemoteDataSource;
  final TenantManager _tenantManager;
  EventSettings? _cachedSettings;

  SettingsRepositoryImpl(
    this._settingsRemoteDataSource,
    this._tenantManager,
  );

  @override
  Future<EventSettings> getEventSettings(String eventoId, String idOrg) async {
    final dto = await _settingsRemoteDataSource.getEventSettings(eventoId, idOrg);
    final settings = EventSettingsMapper.toEntity(dto);
    _cachedSettings = settings;

    // Dynamically update the primaryColor of the tenant if PRIMARY_COLOR is present in settings
    final primaryColor = settings.getSetting('PRIMARY_COLOR');
    if (primaryColor.isNotEmpty) {
      final currentTenant = _tenantManager.value;
      if (currentTenant.primaryColor != primaryColor) {
        await _tenantManager.changeTenant(currentTenant.copyWith(primaryColor: primaryColor));
      }
    }

    return settings;
  }

  @override
  EventSettings? getCachedSettings() => _cachedSettings;
}
