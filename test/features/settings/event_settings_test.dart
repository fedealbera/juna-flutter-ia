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
}
