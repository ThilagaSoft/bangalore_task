import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pro/bloc/country/country_bloc.dart';
import 'package:task_pro/bloc/country/country_event.dart';
import 'package:task_pro/bloc/country/country_state.dart';
import 'package:task_pro/model/country_model.dart';


class CountryController
{
  final BuildContext context;
  Set<Country> countryList  = {};
  CountryController(this.context);
  Country? selectedCountry;


  /// Trigger country list fetch
  void fetchCountries()
  {
    context.read<CountryBloc>().add(FetchCountries());
  }

  /// Handle state side-effects (optional)
  void handleState(CountryState state)
  {
    if (state is CountryError)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)),);
    }
    else if(state is CountryLoaded)
      {
        countryList = state.countries.toSet();
      }
  }


  /// When user selects
  void selectCountry(Country? country) {
    selectedCountry = country;
    if (country != null) {
      context.read<CountryBloc>().add(CountrySelected(country));
    }
  }
}
