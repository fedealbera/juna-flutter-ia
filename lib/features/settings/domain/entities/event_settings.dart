import 'dart:convert';
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

  bool get isEnabledReconocimiento => getSetting('ISENABLED_RECONOCIMIENTO').toUpperCase() == 'TRUE';
  double? get latReconocimiento => double.tryParse(getSetting('LAT_RECONOCIMIENTO'));
  double? get lonReconocimiento => double.tryParse(getSetting('LON_RECONOCIMIENTO'));

  double? get latLargada => double.tryParse(getSetting('LAT_LARGADA'));
  double? get lonLargada => double.tryParse(getSetting('LON_LARGADA'));

  Map<String, dynamic> get acreditacionesMap {
    final value = getSetting('ACREDITACIONES');
    if (value.isEmpty) return const {};
    try {
      final decoded = jsonDecode(value);
      if (decoded is Map<String, dynamic>) {
        return decoded;
      }
    } catch (_) {}
    return const {};
  }

  Map<String, dynamic> get circuitosMap {
    final value = getSetting('CIRCUITOS');
    if (value.isEmpty) return const {};
    try {
      final decoded = jsonDecode(value);
      if (decoded is Map<String, dynamic>) {
        return decoded;
      }
    } catch (_) {}
    return const {};
  }

  bool get isEnabledTiempos => getSetting('ISENABLED_TIEMPOS').toUpperCase() == 'TRUE';
  String get urlTimes => getSetting('URL_TIMES');

  bool get isEnabledInstagram => getSetting('ISENABLED_INSTAGRAM').toUpperCase() == 'TRUE';
  String get urlInstagram => getSetting('URL_INSTAGRAM');

  bool get isEnabledFacebook => getSetting('ISENABLED_FACEBOOK').toUpperCase() == 'TRUE';
  String get urlFacebook => getSetting('URL_FACEBOOK');

  bool get isEnabledWeb => getSetting('ISENABLED_WEB').toUpperCase() == 'TRUE';
  String get urlWeb => getSetting('URL_WEB');

  bool get isEnabledWhatsapp => getSetting('ISENABLED_WHATSAPP').toUpperCase() == 'TRUE';
  String get contactoMensajeWhatsapp => getSetting('CONTACTO_MENSAJE_WHATSAPP');
  String get whatsappPhone => getSetting('WHATSAPP_PHONE');
  String get emailConsulta => getSetting('EMAIL_CONSULTA');
  String get urlStores => getSetting('URL_STORES');
  String get typeVersion => getSetting('TYPE_VERSION');

  Map<String, dynamic> get urlStoresMap {
    final value = getSetting('URL_STORES');
    if (value.isEmpty) return const {};
    try {
      final decoded = jsonDecode(value);
      if (decoded is Map<String, dynamic>) {
        return decoded;
      }
    } catch (_) {}
    return const {};
  }

  @override
  List<Object?> get props => [rawJson];
}
