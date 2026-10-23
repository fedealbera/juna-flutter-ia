import 'package:event_platform_v3/features/settings/domain/entities/event_settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EventSettings - isEnabledCodDesc', () {
    test('returns true when ISENABLED_CODDESC is "TRUE"', () {
      final settings = EventSettings({
        'settings': [
          {'clave': 'ISENABLED_CODDESC', 'valor': 'TRUE'},
        ],
      });
      expect(settings.isEnabledCodDesc, isTrue);
    });

    test('returns true when ISENABLED_CODDESC is "true" (lowercase)', () {
      final settings = EventSettings({
        'settings': [
          {'clave': 'ISENABLED_CODDESC', 'valor': 'true'},
        ],
      });
      expect(settings.isEnabledCodDesc, isTrue);
    });

    test('returns true when ISENABLED_CODDESC is "1"', () {
      final settings = EventSettings({
        'settings': [
          {'clave': 'ISENABLED_CODDESC', 'valor': '1'},
        ],
      });
      expect(settings.isEnabledCodDesc, isTrue);
    });

    test('returns false when ISENABLED_CODDESC is "FALSE"', () {
      final settings = EventSettings({
        'settings': [
          {'clave': 'ISENABLED_CODDESC', 'valor': 'FALSE'},
        ],
      });
      expect(settings.isEnabledCodDesc, isFalse);
    });

    test('returns false when ISENABLED_CODDESC is "0"', () {
      final settings = EventSettings({
        'settings': [
          {'clave': 'ISENABLED_CODDESC', 'valor': '0'},
        ],
      });
      expect(settings.isEnabledCodDesc, isFalse);
    });

    test('returns false when ISENABLED_CODDESC is empty or not configured', () {
      final emptySettings = EventSettings({'settings': []});
      expect(emptySettings.isEnabledCodDesc, isFalse);

      final noSettings = EventSettings({});
      expect(noSettings.isEnabledCodDesc, isFalse);
    });
  });

  group('EventSettings - isEnabledCheckVersion & appVersion', () {
    test('returns true when CHECK_VERSION is "TRUE" and parses APP_VERSION correctly', () {
      final settings = EventSettings({
        'settings': [
          {'clave': 'CHECK_VERSION', 'valor': 'TRUE'},
          {'clave': 'APP_VERSION', 'valor': '3.0.8'},
        ],
      });
      expect(settings.isEnabledCheckVersion, isTrue);
      expect(settings.appVersion, equals('3.0.8'));
    });

    test('returns true when CHECK_VERSION is "1"', () {
      final settings = EventSettings({
        'settings': [
          {'clave': 'CHECK_VERSION', 'valor': '1'},
        ],
      });
      expect(settings.isEnabledCheckVersion, isTrue);
    });

    test('returns false when CHECK_VERSION is "FALSE"', () {
      final settings = EventSettings({
        'settings': [
          {'clave': 'CHECK_VERSION', 'valor': 'FALSE'},
        ],
      });
      expect(settings.isEnabledCheckVersion, isFalse);
    });

    test('returns empty string when APP_VERSION is not configured', () {
      final settings = EventSettings({'settings': []});
      expect(settings.appVersion, isEmpty);
      expect(settings.isEnabledCheckVersion, isFalse);
    });
  });

  group('EventSettings - FECHA_FIN_ACREDITACION_TS & isAcreditacionFinalizada', () {
    test('returns true when FECHA_FIN_ACREDITACION_TS is in the past (seconds)', () {
      final pastSeconds = (DateTime.now().millisecondsSinceEpoch ~/ 1000) - 3600; // 1 hour ago
      final settings = EventSettings({
        'settings': [
          {'clave': 'FECHA_FIN_ACREDITACION_TS', 'valor': pastSeconds.toString()},
        ],
      });

      expect(settings.fechaFinAcreditacionTs, equals(pastSeconds.toString()));
      expect(settings.fechaFinAcreditacion, isNotNull);
      expect(settings.isAcreditacionFinalizada, isTrue);
    });

    test('returns true when FECHA_FIN_ACREDITACION_TS is in the past (milliseconds)', () {
      final pastMillis = DateTime.now().millisecondsSinceEpoch - (3600 * 1000); // 1 hour ago
      final settings = EventSettings({
        'settings': [
          {'clave': 'FECHA_FIN_ACREDITACION_TS', 'valor': pastMillis.toString()},
        ],
      });

      expect(settings.fechaFinAcreditacionTs, equals(pastMillis.toString()));
      expect(settings.fechaFinAcreditacion, isNotNull);
      expect(settings.isAcreditacionFinalizada, isTrue);
    });

    test('returns false when FECHA_FIN_ACREDITACION_TS is in the future', () {
      final futureSeconds = (DateTime.now().millisecondsSinceEpoch ~/ 1000) + 86400; // 1 day in future
      final settings = EventSettings({
        'settings': [
          {'clave': 'FECHA_FIN_ACREDITACION_TS', 'valor': futureSeconds.toString()},
        ],
      });

      expect(settings.fechaFinAcreditacionTs, equals(futureSeconds.toString()));
      expect(settings.fechaFinAcreditacion, isNotNull);
      expect(settings.isAcreditacionFinalizada, isFalse);
    });

    test('returns false when FECHA_FIN_ACREDITACION_TS is missing or empty', () {
      final emptySettings = EventSettings({'settings': []});
      expect(emptySettings.fechaFinAcreditacionTs, isEmpty);
      expect(emptySettings.fechaFinAcreditacion, isNull);
      expect(emptySettings.isAcreditacionFinalizada, isFalse);

      final noSettings = EventSettings({});
      expect(noSettings.fechaFinAcreditacionTs, isEmpty);
      expect(noSettings.fechaFinAcreditacion, isNull);
      expect(noSettings.isAcreditacionFinalizada, isFalse);

      final blankValue = EventSettings({
        'settings': [
          {'clave': 'FECHA_FIN_ACREDITACION_TS', 'valor': '   '},
        ],
      });
      expect(blankValue.fechaFinAcreditacion, isNull);
      expect(blankValue.isAcreditacionFinalizada, isFalse);
    });

    test('returns false when FECHA_FIN_ACREDITACION_TS is invalid/non-numeric string', () {
      final invalidSettings = EventSettings({
        'settings': [
          {'clave': 'FECHA_FIN_ACREDITACION_TS', 'valor': 'invalid_date'},
        ],
      });
      expect(invalidSettings.fechaFinAcreditacion, isNull);
      expect(invalidSettings.isAcreditacionFinalizada, isFalse);
    });
  });

  group('EventSettings - ACTIVAR_ENCUESTA & URL_ENCUESTA', () {
    test('returns true when ACTIVAR_ENCUESTA is "TRUE"', () {
      final settings = EventSettings({
        'settings': [
          {'clave': 'ACTIVAR_ENCUESTA', 'valor': 'TRUE'},
          {'clave': 'URL_ENCUESTA', 'valor': 'https://forms.gle/test'},
        ],
      });
      expect(settings.isEnabledEncuesta, isTrue);
      expect(settings.urlEncuesta, equals('https://forms.gle/test'));
    });

    test('returns true when ACTIVAR_ENCUESTA is "true" (lowercase)', () {
      final settings = EventSettings({
        'settings': [
          {'clave': 'ACTIVAR_ENCUESTA', 'valor': 'true'},
        ],
      });
      expect(settings.isEnabledEncuesta, isTrue);
    });

    test('returns true when ACTIVAR_ENCUESTA is "1"', () {
      final settings = EventSettings({
        'settings': [
          {'clave': 'ACTIVAR_ENCUESTA', 'valor': '1'},
        ],
      });
      expect(settings.isEnabledEncuesta, isTrue);
    });

    test('returns false when ACTIVAR_ENCUESTA is "FALSE"', () {
      final settings = EventSettings({
        'settings': [
          {'clave': 'ACTIVAR_ENCUESTA', 'valor': 'FALSE'},
        ],
      });
      expect(settings.isEnabledEncuesta, isFalse);
    });

    test('returns false when ACTIVAR_ENCUESTA is "0"', () {
      final settings = EventSettings({
        'settings': [
          {'clave': 'ACTIVAR_ENCUESTA', 'valor': '0'},
        ],
      });
      expect(settings.isEnabledEncuesta, isFalse);
    });

    test('returns false when ACTIVAR_ENCUESTA is missing or empty', () {
      final emptySettings = EventSettings({'settings': []});
      expect(emptySettings.isEnabledEncuesta, isFalse);
      expect(emptySettings.urlEncuesta, isEmpty);

      final noSettings = EventSettings({});
      expect(noSettings.isEnabledEncuesta, isFalse);
      expect(noSettings.urlEncuesta, isEmpty);
    });
  });
}
