import 'package:countries_app/src/helpers/app_routes.dart';
import 'package:countries_app/src/pages/add_country/view.dart';
import 'package:countries_app/src/pages/home/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
