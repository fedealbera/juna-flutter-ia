import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/city.dart';
import '../../domain/entities/country.dart';
import '../../domain/entities/province.dart';

part 'geography_state.freezed.dart';

@freezed
class GeographyState with _$GeographyState {
  const factory GeographyState.initial() = GeographyInitial;
  const factory GeographyState.loading() = GeographyLoading;
  const factory GeographyState.countriesLoaded(List<Country> countries) = CountriesLoaded;
  const factory GeographyState.statesLoaded(List<Province> states) = StatesLoaded;
  const factory GeographyState.citiesLoaded(List<City> cities) = CitiesLoaded;
  const factory GeographyState.error(String message) = GeographyError;
}
