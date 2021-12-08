import 'package:countries_app/src/pages/home/state.dart';
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
        ),
        body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.network(
                        'https://flagcdn.com/w320/sm.png',
                        height: 50,
                        width: 50,
                      ),
                      const Text('Republic of San Marino'),
                      Image.network(
                        'https://mainfacts.com/media/images/coats_of_arms/sm.png',
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ).paddingOnly(bottom: 10.0),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 30,
                        child: const FittedBox(
                          fit: BoxFit.contain,
                          child: FaIcon(
                            FontAwesomeIcons.globeAsia,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text('Region: Europe').paddingOnly(left: 4.0),
                    ],
                  ).paddingOnly(bottom: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 30.0,
                            width: 30.0,
                            child: const FittedBox(
                              fit: BoxFit.contain,
                              child: FaIcon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Text('Coordinates:').paddingOnly(left: 4.0),
                        ],
                      ),
                      const Text('lat: 231.21'),
                      const Text('long: 123.12'),
                    ],
                  ).paddingOnly(bottom: 10.0),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 30.0,
                        width: 30.0,
                        child: const FittedBox(
                          fit: BoxFit.contain,
                          child: FaIcon(
                            FontAwesomeIcons.solidMoneyBillAlt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text('Currency: EUR').paddingOnly(left: 4.0),
                    ],
                  ),
                ],
              ).paddingAll(16.0),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10.0);
          },
        ),
      ),
    );
  }
}
