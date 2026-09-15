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
}
