import 'package:injectable/injectable.dart';
import '../entities/event_settings.dart';
import '../repositories/settings_repository.dart';

@lazySingleton
class GetEventSettings {
  final SettingsRepository _repository;

  GetEventSettings(this._repository);

  Future<EventSettings> call({required String eventId, required String idOrg}) {
    return _repository.getEventSettings(eventId, idOrg);
  }
}
