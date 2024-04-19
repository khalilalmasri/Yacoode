import 'package:flutter/material.dart';


final TextEditingController theController = TextEditingController();
late String theHint;
late bool enabled;

Widget theInput(
  TextEditingController theController,
  String theHint,
  TextInputType keyboardType,
  bool enabled,
) {
  return TextField(
      controller: theController,
      decoration: InputDecoration(
        hintText: theHint,
        contentPadding: const EdgeInsets.all(10),
        border: const OutlineInputBorder(),
      ),
      minLines: 1,
      maxLines: 5,
      keyboardType: keyboardType,
      enabled: enabled);
}

SizedBox mySizedBox(double theSize) {
  return SizedBox(
    height: theSize,
  );
}



// void addMedia()

// // async
// {
//   String namear = nameArController.text;
//   String nameen = nameEnController.text;
//   String contentar = contentArController.text;
//   String contenten = contentEnController.text;
//   String descriptionar = descriptionArController.text;
//   String descriptionen = descriptionEnController.text;
//   String price = priceController.text;
//   String newprice = newPriceController.text;

//   final datas = {
//     "image": base64String,
//     "audioFile": base64StringAudio,
//     "playlist_id": "20",
//     "name-ar": namear,
//     "name-en": nameen,
//     "content-ar": contentar,
//     "content-en": contenten,
//     "description-en": descriptionen,
//     "description-ar": descriptionar,
//     "price": "0",
//     "new_price": newprice,
//   };
//   postRequestAddMedia(myurl + myurlAddmedia, datas);
// }
