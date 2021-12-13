import 'package:countries_app/src/helpers/app_colors.dart';
import 'package:countries_app/src/pages/add_country/state.dart';
import 'package:countries_app/src/pages/mixins/dialog_mixin.dart';
import 'package:countries_app/src/widgets/custom_button.dart';
import 'package:countries_app/src/widgets/subtitle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AddCountryPage extends StatelessWidget with DialogMixin {
  final AddCountryLogic logic = Get.put(AddCountryLogic());
  final AddCountryState state = Get.find<AddCountryLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: AppColors.background,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  onPressed: () => logic.onBackPressed(context),
                  icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                ).paddingOnly(right: 4.0),
                const Text('Add country'),
              ],
            ),
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.background,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Subtitle('Name').paddingOnly(bottom: 4.0),
              Obx(() {
                return TextFormField(
                  controller: state.nameController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    hintText: 'Name',
                    filled: true,
                    fillColor: AppColors.grey,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(66.0)),
                    errorText: state.nameErrorMessage.value.isEmpty ? null : state.nameErrorMessage.value,
                  ),
                );
              }).paddingOnly(bottom: 12.0),
              Row(
                children: <Widget>[
                  const FaIcon(
                    FontAwesomeIcons.globe,
                    color: AppColors.orange,
                  ),
                  const Subtitle(
                    'Region: ',
                    showBullet: false,
                  ).paddingSymmetric(horizontal: 4.0),
                  Obx(() {
                    return DropdownButton<String>(
                      value: state.selectedRegion.value,
                      items: state.regions
                          .map<DropdownMenuItem<String>>(
                            (String region) => DropdownMenuItem<String>(
                              value: region,
                              child: Text(region),
                            ),
                          )
                          .toList(),
                      underline: Container(),
                      icon: const FaIcon(
                        FontAwesomeIcons.globe,
                        color: Colors.transparent,
                      ),
                      elevation: 0,
                      style: const TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      onChanged: (String? region) => logic.updateSelectedRegion(region),
                      dropdownColor: AppColors.elementsBackground,
                    );
                  }),
                ],
              ).paddingOnly(bottom: 12.0),
              const Subtitle('Latitude').paddingOnly(bottom: 4.0),
              Obx(() {
                return TextFormField(
                  controller: state.latitudeController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    hintText: 'Latitude',
                    filled: true,
                    fillColor: AppColors.grey,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(66.0)),
                    errorText: state.latitudeErrorMessage.value.isEmpty ? null : state.latitudeErrorMessage.value,
                  ),
                );
              }).paddingOnly(bottom: 12.0),
              const Subtitle('Longitude').paddingOnly(bottom: 4.0),
              Obx(() {
                return TextFormField(
                  controller: state.longitudeController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    hintText: 'Longitude',
                    filled: true,
                    fillColor: AppColors.grey,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(66.0)),
                    errorText: state.longitudeErrorMessage.value.isEmpty ? null : state.longitudeErrorMessage.value,
                  ),
                );
              }).paddingOnly(bottom: 12.0),
              const Subtitle('Currency').paddingOnly(bottom: 4.0),
              Obx(() {
                return TextFormField(
                  controller: state.currencyController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    hintText: 'Currency',
                    filled: true,
                    fillColor: AppColors.grey,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(66.0)),
                    errorText: state.currencyErrorMessage.value.isEmpty ? null : state.currencyErrorMessage.value,
                  ),
                );
              }).paddingOnly(bottom: 12.0),
              const Spacer(),
              CustomButton(
                'Add country',
                color: AppColors.orange,
                icon: FontAwesomeIcons.cloudUploadAlt,
                onTap: logic.onAddPressed,
              ).paddingSymmetric(horizontal: 64.0, vertical: 12.0),
            ],
          ).paddingAll(16.0),
        ),
      ),
    );
  }
}
