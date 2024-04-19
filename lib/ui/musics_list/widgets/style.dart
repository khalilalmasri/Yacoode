import 'package:flutter/material.dart';

Color firstGradientColor = const Color.fromARGB(255, 201, 127, 241);
Color secondGradientColor = const Color.fromARGB(255, 148, 33, 210);
Color thirdGradientColor = Colors.deepPurple;
myBoxDecorationbg() {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [
        firstGradientColor,
        secondGradientColor,
        thirdGradientColor,
      ],
    ),
  );
}


