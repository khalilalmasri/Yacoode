// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
// import 'package:http/http.dart' as http;
// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yacoode/form_music/resources/add_data.dart';
// import 'package:yacoode/ui/musics_list/widgets/custom_alert.dart';
import 'package:yacoode/ui/musics_list/widgets/custom_app_bar.dart';
import 'package:yacoode/ui/musics_list/widgets/custom_text_field.dart';
import 'package:yacoode/ui/musics_list/widgets/style.dart';
import 'package:file_picker/file_picker.dart';
import '../data/models/apis.dart';
import '../ui/musics_list/widgets/custom_navigation_btn.dart';
import 'utils.dart';

class AddMediaForm extends StatefulWidget {
  const AddMediaForm({super.key});
  @override
  State<AddMediaForm> createState() => _AddMediaFormState();
}

class _AddMediaFormState extends State<AddMediaForm>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    try {
      base64String = base64.encode(img!); // asdfjaklsdfjl//asdfasd348309
    } catch (e) {
      print(e);
    }
    // base64String = base64.encode(img!); // asdfjaklsdfjl//asdfasd348309
    print(base64String);
    setState(() {
      image = img;
    });
  }

  Future<void> pickAudioFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      // type: FileType.audio,
      type: FileType.custom,
      // allowMultiple: true,
      allowedExtensions: ['mp3'],
    );
    try {
      if (result != null) {
        setState(() {
          // String? filePath = result.files.single?.path;
          String? filePath = result.files.single.path;
          // if (filePath != null)
          // {
          sw = true;
          audioFile = File(filePath!);
          // audioFileName = audioFile?.path.toString() ?? '';
          audioFileName = audioFile.path.toString();
          // }
          print('audioFile................. $audioFile');
          String base64EncodedAudio = base64Encode(audioFile.readAsBytesSync());
          base64StringAudio = base64EncodedAudio;
          print(
              'base64String===========================================: $base64StringAudio');

          // audioFile = File(result.files.single.path);
        });
      }
    } catch (e) {
      print('error: $e');
    }
  }

  // final FilePickerResult? result = await FilePicker.platform.pickFiles(
  //   type: FileType.audio,
  // );

  void addMedia() async {
    String namear = nameArController.text;
    String nameen = nameEnController.text;
    String contentar = contentArController.text;
    String contenten = contentEnController.text;
    String descriptionar = descriptionArController.text;
    String descriptionen = descriptionEnController.text;
    // String price = priceController.text;
    String newprice = newPriceController.text;

    final datas = {
      "image": "data:image/png;base64,$base64String",
      "audioFile": "data:audio/mp3;base64,$base64StringAudio",
      "playlist_id": "20",
      "name-ar": namear,
      "name-en": nameen,
      "content-ar": contentar,
      "content-en": contenten,
      "description-en": descriptionen,
      "description-ar": descriptionar,
      "price": "0",
      "new_price": newprice,
    };
    print('-----------------------------------------------------');
    await postRequestAddMedia(myurl + myurlAddmedia, datas, context);
    print('-----------------------------------------------------');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("Add Media"),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: myBoxDecorationbg(),
        child: ListView(
          children: [
            mySizedBox(50),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => theInput(
                addTextForm[index][0],
                addTextForm[index][1],
                addTextForm[index][2],
                addTextForm[index][3],
              ),
              separatorBuilder: (context, index) => mySizedBox(24),
              itemCount: addTextForm.length,
            ),
            image != null
                ? InkWell(
                    onTap: selectImage,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      height: 300,
                      child: Image.memory(image!),
                    ),
                  )
                : InkWell(
                    onTap: selectImage,
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: Image.asset('assets/selectimage.png'),
                    ),
                  ),
            sw == false
                ? InkWell(
                    onTap: pickAudioFile,
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.add_box_sharp),
                        Text('add music'),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: pickAudioFile,
                    child: SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            Text('audio file: $audioFileName'),
                          ],
                        )),
                  ),
            mySizedBox(24),
            // myElevatedButton('add Media', addMedia),
            MyNBtn(
              onPressed: () {
                addMedia();
              }, 
            ),
            mySizedBox(24),
          ],
        ),
      ),
    );
  }
}

// Future<void> postRequestAddMedia(
//     String url, Map<String, dynamic> data, context) async {
//   final encodedData = jsonEncode(data);
//   final response = await http.post(
//     Uri.parse(url),
//     headers: theHeader,
//     body: encodedData,
//   );
//   if (response.statusCode == 200) {
//     print(
//         'Request sent successfully2222222222222222222222222222222222222222222222. Response: ${response.body}');
//     myShowAlert(context, jsonDecode(response.body.toString())['message'], () {},
//         DialogType.success, Colors.green);
//     cleaField();
//   } else {
//     print(
//         'Error sending request55555555555555555555555555555555555555555555555: ${response.statusCode} ');
//     myShowAlert(context, jsonDecode(response.body.toString())['message'], () {},
//         DialogType.error, Colors.red);

//     // .whenComplete((value) => goToSplash(context));
//   }
//   print('body------------------------------------------------: ${encodedData}');
//   print(response.body);
//   print(jsonDecode(response.body.toString())['message']);
// }
