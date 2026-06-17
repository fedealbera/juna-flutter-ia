import 'package:freezed_annotation/freezed_annotation.dart';

part 'geography_event.freezed.dart';

@freezed
class GeographyEvent with _$GeographyEvent {
  const factory GeographyEvent.getCountries() = FetchCountries;
  const factory GeographyEvent.getStates({required String countryId}) = FetchStates;
  const factory GeographyEvent.getCities({required String stateId}) = FetchCities;
}
