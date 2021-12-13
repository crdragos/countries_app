import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
    this.text, {
    Key? key,
    required this.icon,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(66.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FaIcon(
              icon,
              color: Colors.white,
            ).paddingOnly(right: 4.0),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 17.0, vertical: 10.0),
      ),
    );
  }
}
