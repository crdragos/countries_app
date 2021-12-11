import 'package:countries_app/src/models/country.dart';
import 'package:get/get.dart';

class CachedCountriesService {
  static CachedCountriesService get to => Get.find<CachedCountriesService>();

  final Map<String, List<Country>> countries = <String, List<Country>>{};
}
