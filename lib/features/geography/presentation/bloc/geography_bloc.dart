import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_cities.dart';
import '../../domain/usecases/get_countries.dart';
import '../../domain/usecases/get_states.dart';
import 'geography_event.dart';
import 'geography_state.dart';

@injectable
class GeographyBloc extends Bloc<GeographyEvent, GeographyState> {
  final GetCountries _getCountries;
  final GetStates _getStates;
  final GetCities _getCities;

  GeographyBloc(
    this._getCountries,
    this._getStates,
    this._getCities,
  ) : super(const GeographyState.initial()) {
    on<FetchCountries>((event, emit) async {
      emit(const GeographyState.loading());
      try {
        final countries = await _getCountries();
        emit(GeographyState.countriesLoaded(countries));
      } catch (e) {
        emit(GeographyState.error(e.toString()));
      }
    });

    on<FetchStates>((event, emit) async {
      emit(const GeographyState.loading());
      try {
        final states = await _getStates(countryId: event.countryId);
        emit(GeographyState.statesLoaded(states));
      } catch (e) {
        emit(GeographyState.error(e.toString()));
      }
    });

    on<FetchCities>((event, emit) async {
      emit(const GeographyState.loading());
      try {
        final cities = await _getCities(stateId: event.stateId);
        emit(GeographyState.citiesLoaded(cities));
      } catch (e) {
        emit(GeographyState.error(e.toString()));
      }
    });
  }
}
