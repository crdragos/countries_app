import 'package:countries_app/src/helpers/app_routes.dart';
import 'package:countries_app/src/pages/home/state.dart';
import 'package:countries_app/src/widgets/country_tile.dart';
import 'package:countries_app/src/widgets/custom_button.dart';
import 'package:countries_app/src/widgets/subtitle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Countries'),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.solidPlusSquare,
                color: Colors.greenAccent,
              ),
              onPressed: () => Get.toNamed<dynamic>(AppRoutes.add),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                      hintText: 'Region',
                      filled: true,
                      fillColor: Colors.greenAccent,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(66.0)),
                      // errorText: logic.validateForm(state.regionController.text),
                    ),
                    controller: state.regionController,
                  ),
                ),
                CustomButton(
                  'Download',
                  onTap: () => logic.onDownloadPressed(state.regionController.text),
                ).paddingOnly(left: 12.0),
              ],
            ).paddingOnly(top: 12.0),
            const Subtitle('Countries').paddingSymmetric(vertical: 12.0),
            Expanded(
              child: Obx(() {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CountryTile(state.countries[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10.0);
                  },
                );
              }),
            ),
          ],
        ).paddingSymmetric(horizontal: 16.0),
      ),
    );
  }
}
