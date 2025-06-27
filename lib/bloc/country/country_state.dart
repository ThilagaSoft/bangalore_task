import 'package:task_pro/model/country_model.dart';

abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final List<Country> countries;
  final Country? selectedCountry;

  CountryLoaded(this.countries, {this.selectedCountry});
}

class CountryError extends CountryState {
  final String message;
  CountryError(this.message);
}
