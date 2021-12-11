import 'package:countries_app/src/helpers/app_routes.dart';
import 'package:countries_app/src/pages/add_country/view.dart';
import 'package:countries_app/src/pages/home/view.dart';
import 'package:countries_app/src/services/cached_countries_service.dart';
import 'package:countries_app/src/services/countries_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

void main() {
  final Client client = Client();

  Get.put(CountriesService(client: client));
  Get.put(CachedCountriesService());

  runApp(const CountriesApp());
}

class CountriesApp extends StatelessWidget {
  const CountriesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Countries Application',
      home: HomePage(),
      initialRoute: AppRoutes.home,
      getPages: <GetPage<String>>[
        GetPage<String>(name: AppRoutes.home, page: () => HomePage()),
        GetPage<String>(name: AppRoutes.add, page: () => AddCountryPage()),
      ],
    );
  }
}
