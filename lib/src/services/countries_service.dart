import 'dart:convert';

import 'package:countries_app/src/models/country.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class CountriesService {
  const CountriesService({required Client client}) : _client = client;

  final Client _client;

  static CountriesService get to => Get.find<CountriesService>();

  Future<List<Country>> getCountriesByRegion(String region) async {
    printInfo(info: 'https://restcountries.com/v3.1/region/$region');
    final Uri uri = Uri.parse('https://restcountries.com/v3.1/region/$region');

    // ignore: always_specify_types
    final response = await _client.get(uri);

    final List<dynamic> countriesJson = jsonDecode(response.body) as List<dynamic>;

    return countriesJson //
        .map((dynamic json) => Country.fromJson(json))
        .toList();
  }
}
