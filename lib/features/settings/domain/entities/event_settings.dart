import 'package:equatable/equatable.dart';

class EventSettings extends Equatable {
  final Map<String, dynamic> rawJson;

  const EventSettings(this.rawJson);

  String get id => rawJson['id']?.toString() ?? '';

  String getSetting(String key) {
    final settingsList = rawJson['settings'];
    if (settingsList is List) {
      for (final item in settingsList) {
        if (item is Map && item['clave'] == key) {
          return item['valor']?.toString() ?? '';
        }
      }
    }
    return '';
  }

  String get appTitle => getSetting('APP_TITLE');
  String get fechaCarrera => getSetting('FECHA_CARRERA');
  String get edicion => getSetting('EDICION');
  String get tipoCarrera => getSetting('TIPO_CARRERA');
  String get fechaCarreraTs => getSetting('FECHA_CARRERA_TS');
  String get urlInscripciones => getSetting('URL_INSCRIPCIONES');

  @override
  List<Object?> get props => [rawJson];
}
