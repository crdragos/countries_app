import 'package:countries_app/src/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Subtitle extends StatelessWidget {
  const Subtitle(this.text, {Key? key, this.showBullet = true}) : super(key: key);

  final String text;
  final bool showBullet;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        if (showBullet)
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: AppColors.orange,
              shape: BoxShape.circle,
            ),
          ).paddingOnly(right: 4.0),
        Text(
          text,
          style: const TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
