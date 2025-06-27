import 'package:task_pro/model/country_model.dart';

abstract class CountryEvent {}

class FetchCountries extends CountryEvent {}

class CountrySelected extends CountryEvent {
  final Country selectedCountry;
  CountrySelected(this.selectedCountry);
}
