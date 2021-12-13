import 'package:countries_app/src/models/country.dart';
import 'package:countries_app/src/pages/mixins/dialog_mixin.dart';
import 'package:countries_app/src/services/cached_countries_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'state.dart';

class AddCountryLogic extends GetxController with DialogMixin {
  final AddCountryState state = AddCountryState();

  void updateSelectedRegion(String? region) {
    if (region != null) {
      state.selectedRegion.value = region;
    }
  }

  bool _isValidName(String name) {
    if (name.length <= 5) {
      state.nameErrorMessage.value = 'Name must have at leas 6 letters';
      return false;
    }

    state.nameErrorMessage.value = '';
    return true;
  }

  bool _isValidLatitude(String latitude) {
    final double? value = double.tryParse(latitude);

    if (value == null) {
      state.latitudeErrorMessage.value = 'Latitude must be a number';
      return false;
    }

    if (value < 50 || value > 150) {
      state.latitudeErrorMessage.value = 'Latitude must be a number between 50 and 150';
      return false;
    }

    state.latitudeErrorMessage.value = '';
    return true;
  }

  bool _isValidLongitude(String longitude) {
    final double? value = double.tryParse(longitude);

    if (value == null) {
      state.longitudeErrorMessage.value = 'Longitude must be a number';
      return false;
    }

    if (value < 50 || value > 150) {
      state.longitudeErrorMessage.value = 'Longitude must be a number between 50 and 150';
      return false;
    }

    state.longitudeErrorMessage.value = '';
    return true;
  }

  bool _isValidCurrency(String currency) {
    if (currency.length <= 15) {
      state.currencyErrorMessage.value = 'Currency must have at leas 16 letters';
      return false;
    }

    state.currencyErrorMessage.value = '';
    return true;
  }

  void onBackPressed(BuildContext context) {
    showError(context, 'Do you want to save this country?', () => _onYesPressed(context));
  }

  bool _validateForm(String name, String latitude, String longitude, String currency) {
    return _isValidName(name) &&
        _isValidLatitude(latitude) &&
        _isValidLongitude(longitude) &&
        _isValidCurrency(currency);
  }

  void onAddPressed() {
    if (_validateForm(state.nameController.text, state.latitudeController.text, state.longitudeController.text,
        state.currencyController.text)) {
      CachedCountriesService.to.addedCountries.add(
        Country(
          name: state.nameController.text,
          region: state.selectedRegion.value,
          currencies: <String, dynamic>{state.currencyController.text: state.currencyController.text},
          longitude: double.tryParse(state.longitudeController.text) ?? -1,
          latitude: double.tryParse(state.latitudeController.text) ?? -1,
        ),
      );
      Get.back<dynamic>();
    }
  }

  void _onYesPressed(BuildContext context) {
    Navigator.of(context).pop();

    if (_validateForm(state.nameController.text, state.latitudeController.text, state.longitudeController.text,
        state.currencyController.text)) {
      CachedCountriesService.to.addedCountries.add(
        Country(
          name: state.nameController.text,
          region: state.selectedRegion.value,
          currencies: <String, dynamic>{state.currencyController.text: state.currencyController.text},
          longitude: double.tryParse(state.longitudeController.text) ?? -1,
          latitude: double.tryParse(state.latitudeController.text) ?? -1,
        ),
      );
      Get.back<dynamic>();
    }
  }
}
