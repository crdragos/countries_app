import 'package:countries_app/src/helpers/app_colors.dart';
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
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text('Countries'),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: AppColors.background,
          actions: <Widget>[
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.solidPlusSquare,
                color: AppColors.orange,
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
                  child: Obx(() {
                    return TextFormField(
                      controller: state.regionController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                        hintText: 'Region',
                        filled: true,
                        fillColor: AppColors.grey,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(66.0)),
                        errorText: state.errorMessage.value.isEmpty ? null : state.errorMessage.value,
                      ),
                    );
                  }),
                ),
                CustomButton(
                  'Download',
                  color: AppColors.orange,
                  icon: FontAwesomeIcons.cloudDownloadAlt,
                  onTap: () => logic.onDownloadPressed(state.regionController.text),
                ).paddingOnly(left: 12.0),
              ],
            ).paddingOnly(top: 12.0),
            CustomButton(
              'Added countries',
              icon: FontAwesomeIcons.listAlt,
              onTap: () => Get.toNamed<dynamic>(AppRoutes.added),
              color: AppColors.purple,
            ).paddingSymmetric(vertical: 12.0),
            const Subtitle('Countries').paddingSymmetric(vertical: 12.0),
            Obx(() {
              if (state.countries.isEmpty && !state.showMessage.value) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.purple,
                ));
              }
              if (state.showMessage.value) {
                return const Center(
                  child: Text(
                    'Please insert a region and press the download button',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.orange,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return Container();
            }),
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
