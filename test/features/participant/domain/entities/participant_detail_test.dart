import 'package:flutter_test/flutter_test.dart';
import 'package:event_platform_v3/features/participant/domain/entities/participant_detail.dart';

void main() {
  group('ParticipantDetail', () {
    test('isAcreditado returns true when estado is "AC"', () {
      const detail = ParticipantDetail({
        'corredor': {
          'id': '1',
          'nombre': 'Juan',
          'apellido': 'Perez',
          'estado': 'AC',
        },
      });

      expect(detail.status, 'AC');
      expect(detail.isAcreditado, isTrue);
    });

    test('isAcreditado returns true when estado is lowercase "ac" or has whitespace', () {
      const detailLower = ParticipantDetail({
        'estado': 'ac',
      });
      expect(detailLower.isAcreditado, isTrue);

      const detailWhitespace = ParticipantDetail({
        'estado': '  AC  ',
      });
      expect(detailWhitespace.isAcreditado, isTrue);
    });

    test('isAcreditado returns true when status field is "AC"', () {
      const detail = ParticipantDetail({
        'status': 'AC',
      });

      expect(detail.status, 'AC');
      expect(detail.isAcreditado, isTrue);
    });

    test('isAcreditado returns false for other statuses', () {
      const detailIn = ParticipantDetail({
        'estado': 'IN',
      });
      expect(detailIn.isAcreditado, isFalse);

      const detailOk = ParticipantDetail({
        'estado': 'OK',
      });
      expect(detailOk.isAcreditado, isFalse);

      const detailEmpty = ParticipantDetail({});
      expect(detailEmpty.isAcreditado, isFalse);
    });
  });

  group('ParticipantDetail - linkEncuesta & linkEncuestaUrl', () {
    test('extracts linkEncuesta from corredor map', () {
      const detail = ParticipantDetail({
        'corredor': {
          'linkEncuesta': '/website/juna.net.ar/site/public_html/lagaceta2026_off/encuesta2026.php?token=xyz',
        },
      });

      expect(
        detail.linkEncuesta,
        '/website/juna.net.ar/site/public_html/lagaceta2026_off/encuesta2026.php?token=xyz',
      );
      expect(
        detail.linkEncuestaUrl,
        'https://juna.net.ar/lagaceta2026_off/encuesta2026.php?token=xyz',
      );
    });

    test('resolves full https and http URLs as-is', () {
      const detailHttps = ParticipantDetail({
        'corredor': {
          'linkEncuesta': 'https://forms.gle/survey123',
        },
      });
      expect(detailHttps.linkEncuestaUrl, 'https://forms.gle/survey123');

      const detailHttp = ParticipantDetail({
        'corredor': {
          'linkEncuesta': 'http://example.com/encuesta',
        },
      });
      expect(detailHttp.linkEncuestaUrl, 'http://example.com/encuesta');
    });

    test('resolves relative URLs starting with slash', () {
      const detail = ParticipantDetail({
        'corredor': {
          'linkEncuesta': '/event/survey.php',
        },
      });
      expect(detail.linkEncuestaUrl, 'https://juna.net.ar/event/survey.php');
    });

    test('returns empty string when linkEncuesta is missing or blank', () {
      const emptyDetail = ParticipantDetail({});
      expect(emptyDetail.linkEncuesta, isEmpty);
      expect(emptyDetail.linkEncuestaUrl, isEmpty);

      const blankDetail = ParticipantDetail({
        'corredor': {'linkEncuesta': '   '},
      });
      expect(blankDetail.linkEncuestaUrl, isEmpty);
    });
  });

  group('ParticipantDetail - encuestaRespondida', () {
    test('returns true when boolean true', () {
      const detail = ParticipantDetail({
        'corredor': {'encuestaRespondida': true},
      });
      expect(detail.encuestaRespondida, isTrue);
    });

    test('returns false when boolean false', () {
      const detail = ParticipantDetail({
        'corredor': {'encuestaRespondida': false},
      });
      expect(detail.encuestaRespondida, isFalse);
    });

    test('returns true for string "true" or "1"', () {
      const detailStrTrue = ParticipantDetail({
        'corredor': {'encuestaRespondida': 'true'},
      });
      expect(detailStrTrue.encuestaRespondida, isTrue);

      const detailStr1 = ParticipantDetail({
        'corredor': {'encuestaRespondida': '1'},
      });
      expect(detailStr1.encuestaRespondida, isTrue);
    });

    test('returns false for string "false", "0" or arbitrary text', () {
      const detailStrFalse = ParticipantDetail({
        'corredor': {'encuestaRespondida': 'false'},
      });
      expect(detailStrFalse.encuestaRespondida, isFalse);

      const detailStr0 = ParticipantDetail({
        'corredor': {'encuestaRespondida': '0'},
      });
      expect(detailStr0.encuestaRespondida, isFalse);
    });

    test('returns true for integer 1 and false for integer 0', () {
      const detailInt1 = ParticipantDetail({
        'corredor': {'encuestaRespondida': 1},
      });
      expect(detailInt1.encuestaRespondida, isTrue);

      const detailInt0 = ParticipantDetail({
        'corredor': {'encuestaRespondida': 0},
      });
      expect(detailInt0.encuestaRespondida, isFalse);
    });

    test('returns false when missing or null', () {
      const detailNull = ParticipantDetail({
        'corredor': {'encuestaRespondida': null},
      });
      expect(detailNull.encuestaRespondida, isFalse);

      const detailEmpty = ParticipantDetail({});
      expect(detailEmpty.encuestaRespondida, isFalse);
    });
  });
}

