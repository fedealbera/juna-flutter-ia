import '../../domain/entities/event_settings.dart';

abstract class SettingsRepository {
  Future<EventSettings> getEventSettings(String eventoId, String idOrg);
}
