import 'package:countries_app/src/models/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeState {
  HomeState();

  final RxList<Country> countries = <Country>[].obs;
  final TextEditingController regionController = TextEditingController();
  final RxString errorMessage = ''.obs;
}
