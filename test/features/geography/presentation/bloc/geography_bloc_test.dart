import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:event_platform_v3/features/geography/domain/usecases/get_countries.dart';
import 'package:event_platform_v3/features/geography/domain/usecases/get_states.dart';
import 'package:event_platform_v3/features/geography/domain/usecases/get_cities.dart';
import 'package:event_platform_v3/features/geography/domain/entities/country.dart';
import 'package:event_platform_v3/features/geography/presentation/bloc/geography_bloc.dart';
import 'package:event_platform_v3/features/geography/presentation/bloc/geography_event.dart';
import 'package:event_platform_v3/features/geography/presentation/bloc/geography_state.dart';

class MockGetCountries extends Mock implements GetCountries {}
class MockGetStates extends Mock implements GetStates {}
class MockGetCities extends Mock implements GetCities {}

void main() {
  late MockGetCountries mockGetCountries;
  late MockGetStates mockGetStates;
  late MockGetCities mockGetCities;
  late GeographyBloc bloc;

  setUp(() {
    mockGetCountries = MockGetCountries();
    mockGetStates = MockGetStates();
    mockGetCities = MockGetCities();
    bloc = GeographyBloc(mockGetCountries, mockGetStates, mockGetCities);
  });

  tearDown(() {
    bloc.close();
  });

  group('GeographyBloc', () {
    blocTest<GeographyBloc, GeographyState>(
      'emits [loading, countriesLoaded] when LoadCountries is added successfully',
      build: () {
        when(() => mockGetCountries()).thenAnswer((_) async => [
          const Country({'id': 'AR', 'nombre': 'Argentina'}),
        ]);
        return bloc;
      },
      act: (bloc) => bloc.add(const GeographyEvent.getCountries()),
      expect: () => [
        const GeographyState.loading(),
        const GeographyState.countriesLoaded([
          Country({'id': 'AR', 'nombre': 'Argentina'}),
        ]),
      ],
    );

    blocTest<GeographyBloc, GeographyState>(
      'emits [loading, error] when LoadCountries fails',
      build: () {
        when(() => mockGetCountries()).thenThrow(Exception('Failed to load'));
        return bloc;
      },
      act: (bloc) => bloc.add(const GeographyEvent.getCountries()),
      expect: () => [
        const GeographyState.loading(),
        const GeographyState.error('Exception: Failed to load'),
      ],
    );
  });
}
