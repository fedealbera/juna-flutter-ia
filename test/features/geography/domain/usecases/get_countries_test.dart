import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:event_platform_v3/features/geography/domain/repositories/geography_repository.dart';
import 'package:event_platform_v3/features/geography/domain/usecases/get_countries.dart';
import 'package:event_platform_v3/features/geography/domain/entities/country.dart';

class MockGeographyRepository extends Mock implements GeographyRepository {}

void main() {
  late GetCountries useCase;
  late MockGeographyRepository mockRepository;

  setUp(() {
    mockRepository = MockGeographyRepository();
    useCase = GetCountries(mockRepository);
  });

  test('should return list of Country from repository', () async {
    // Arrange
    final countries = [
      const Country({'id': 'AR', 'nombre': 'Argentina'}),
    ];
    when(() => mockRepository.getCountries()).thenAnswer((_) async => countries);

    // Act
    final result = await useCase();

    // Assert
    expect(result, countries);
    verify(() => mockRepository.getCountries()).called(1);
  });
}
