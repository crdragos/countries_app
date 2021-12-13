import 'dart:io';

import 'package:countries_app/src/models/country.dart';
import 'package:countries_app/src/services/cached_countries_service.dart';
import 'package:countries_app/src/services/countries_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  Future<void> onDownloadPressed(String region) async {
    if (!_isValidRegion(region)) {
      _loseFocus();
      return;
    }

    state.showMessage.value = false;
    state.countries.clear();
    sleep(3.seconds);
    state.regionController.clear();

    if (CachedCountriesService.to.countries.keys.contains(region)) {
      _updateCountries(CachedCountriesService.to.countries[region] ?? <Country>[]);
      _loseFocus();
      return;
    }

    final List<Country> countries = await CountriesService.to.getCountriesByRegion(region);
    CachedCountriesService.to.countries[region] = countries;
    _updateCountries(CachedCountriesService.to.countries[region] ?? <Country>[]);
    _loseFocus();
    return;
  }

  void _updateCountries(List<Country> countries) {
    state.countries.clear();
    state.countries.addAll(countries);
  }

  bool _isValidRegion(String region) {
    if (region.isEmpty) {
      state.errorMessage.value = 'Please insert a region';
      return false;
    }

    if (region.length < 2) {
      state.errorMessage.value = 'Region name must have at least 2 letters';
      return false;
    }

    final RegExp letters = RegExp(r'^[a-zA-Z]+$');

    if (!letters.hasMatch(region)) {
      state.errorMessage.value = 'Only letters are allowed';
      return false;
    }

    state.errorMessage.value = '';
    return true;
  }

  void _loseFocus() {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}
