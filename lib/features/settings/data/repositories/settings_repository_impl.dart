import 'package:injectable/injectable.dart';
import '../datasource/settings_remote_datasource.dart';
import '../../domain/entities/event_settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../mappers/event_settings_mapper.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteDataSource _settingsRemoteDataSource;

  SettingsRepositoryImpl(this._settingsRemoteDataSource);

  @override
  Future<EventSettings> getEventSettings(String eventoId, String idOrg) async {
    final dto = await _settingsRemoteDataSource.getEventSettings(eventoId, idOrg);
    return EventSettingsMapper.toEntity(dto);
  }
}
