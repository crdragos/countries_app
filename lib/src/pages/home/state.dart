import 'package:countries_app/src/models/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeState {
  HomeState();

  final RxList<Country> countries = <Country>[].obs;
  final TextEditingController regionController = TextEditingController();
  final GlobalKey<FormState> regionFormKey = GlobalKey<FormState>();
  final RxString errorMessage = ''.obs;
  final RxBool isLoading = false.obs;
  final RxBool showMessage = true.obs;
}
