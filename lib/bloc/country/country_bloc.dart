import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pro/apiClient/country_repository.dart';
import 'package:task_pro/bloc/country/country_event.dart';
import 'package:task_pro/bloc/country/country_state.dart';


class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryApiService apiService;

  CountryBloc(this.apiService) : super(CountryInitial())
  {
    on<FetchCountries>((event, emit) async
    {
      emit(CountryLoading());
      try {
        final countries = await apiService.fetchCountries();
        emit(CountryLoaded(countries));
      } catch (e) {
        emit(CountryError(e.toString()));
      }
    });

    on<CountrySelected>((event, emit) {
      if (state is CountryLoaded) {
        emit(CountryLoaded(
          (state as CountryLoaded).countries,
          selectedCountry: event.selectedCountry,
        ));
      }
    });
  }
}
