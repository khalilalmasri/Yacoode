import 'package:flutter/material.dart';
import 'package:yacoode/ui/musics_list/widgets/custom_text.dart';
late String rowImage;
late String rowText;
customRow(rowImage, rowText) {
  return Row(
    mainAxisSize: MainAxisSize.min, // Ensures compact row
    children: [
      // ClipRRect(
      // borderRadius: BorderRadius.circular(10.0),
      // child:
      Image(
        image: AssetImage(rowImage),
        fit: BoxFit.cover,
        height: 100, 
        width: 100, 
        // ),
      ),
      // ),

      const SizedBox(width: 1),
      myHeaderText(rowText),
    ],
  );
}
