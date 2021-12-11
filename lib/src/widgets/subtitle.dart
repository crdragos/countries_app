import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Subtitle extends StatelessWidget {
  const Subtitle(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
          ),
        ).paddingOnly(right: 4.0),
        Text(
          text,
          style: const TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
