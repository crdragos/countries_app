import 'package:countries_app/src/pages/add_country/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AddCountryPage extends StatelessWidget {
  final AddCountryLogic logic = Get.put(AddCountryLogic());
  final AddCountryState state = Get.find<AddCountryLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
