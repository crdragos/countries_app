import 'package:countries_app/src/models/country.dart';
import 'package:countries_app/src/services/cached_countries_service.dart';
import 'package:countries_app/src/services/countries_service.dart';
import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  Future<void> onDownloadPressed(String region) async {
    if (CachedCountriesService.to.countries.keys.contains(region)) {
      _updateCountries(CachedCountriesService.to.countries[region] ?? <Country>[]);
      return;
    }

    final List<Country> countries = await CountriesService.to.getCountriesByRegion(region);
    CachedCountriesService.to.countries[region] = countries;
    _updateCountries(countries);
    return;
  }

  void _updateCountries(List<Country> countries) {
    state.countries.clear();
    state.countries.addAll(countries);
  }

  String? validateForm(String region) {
    if (region.isEmpty) {
      state.errorMessage.value = 'Please insert a region';
    }

    final RegExp letters = RegExp(r'^[a-zA-Z]+$');

    if (!letters.hasMatch(region)) {
      state.errorMessage.value = 'Only letters are allowed';
    }

    if (state.errorMessage.value.isEmpty) {
      return null;
    }

    return state.errorMessage.value;
  }
}
