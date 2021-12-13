import 'package:countries_app/src/helpers/app_colors.dart';
import 'package:countries_app/src/pages/added_countries/state.dart';
import 'package:countries_app/src/services/cached_countries_service.dart';
import 'package:countries_app/src/widgets/country_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AddedCountriesPage extends StatelessWidget {
  final AddedCountriesLogic logic = Get.put(AddedCountriesLogic());
  final AddedCountriesState state = Get.find<AddedCountriesLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                  onPressed: Get.back,
                ).paddingOnly(right: 4.0),
                const Text('Added countries'),
              ],
            ),
            elevation: 0,
            backgroundColor: AppColors.background,
            automaticallyImplyLeading: false,
          ),
          backgroundColor: AppColors.background,
          body: Column(
            children: <Widget>[
              if (CachedCountriesService.to.addedCountries.isEmpty)
                Center(
                  child: const Text(
                    'There are no added countries',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.orange,
                    ),
                  ).paddingOnly(top: 24.0),
                )
              else
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: CachedCountriesService.to.addedCountries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CountryTile(CachedCountriesService.to.addedCountries.reversed.elementAt(index));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 10.0);
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
