import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_event.freezed.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.getSettings({
    required String eventId,
    required String idOrg,
  }) = FetchSettings;
}
