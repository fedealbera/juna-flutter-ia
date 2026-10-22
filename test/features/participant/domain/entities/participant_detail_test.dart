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
}
