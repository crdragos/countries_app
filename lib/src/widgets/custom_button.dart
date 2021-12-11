import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(this.text, {Key? key, required this.onTap}) : super(key: key);

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(66.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const FaIcon(FontAwesomeIcons.cloudDownloadAlt).paddingOnly(right: 4.0),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 17.0, vertical: 10.0),
      ),
    );
  }
}
