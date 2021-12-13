import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddCountryState {
  AddCountryState();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();

  final RxString nameErrorMessage = ''.obs;
  final RxString latitudeErrorMessage = ''.obs;
  final RxString longitudeErrorMessage = ''.obs;
  final RxString currencyErrorMessage = ''.obs;

  final List<String> regions = <String>['Africa', 'Americas', 'Asia', 'Europe', 'Oceania'];
  final RxString selectedRegion = 'Africa'.obs;
}
