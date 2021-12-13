import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin DialogMixin {
  Future<void> showError(BuildContext context, String title, void Function() onConfirmPressed) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              actions: <Widget>[
                IconButton(
                  icon: const Text('Yes'),
                  onPressed: onConfirmPressed,
                ),
                IconButton(
                  icon: const Text('No'),
                  onPressed: () {
                    Navigator.pop(context);
                    Get.back<dynamic>();
                  },
                ),
              ],
            );
          });
    } else {
      return showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(title),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}
