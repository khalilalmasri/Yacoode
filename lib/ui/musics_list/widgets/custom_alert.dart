import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

myShowAlert(BuildContext context, String title, Function func, DialogType type,
    Color color) {
  AwesomeDialog(
          dismissOnTouchOutside: false,
          context: context,
          animType: AnimType.topSlide,
          dialogType: type,
          body: Center(
            child: Text(
              title,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          btnOkOnPress: () {
            func;
          },
          btnOkColor: color)
      .show();
}
