// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'dart:convert';
// import 'dart:io';
// import 'dart:js_util';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yacoode/form_music/utils.dart';
import 'package:yacoode/ui/musics_list/widgets/custom_text_field.dart';
import 'package:yacoode/ui/musics_list/widgets/custom_alert.dart';
import 'package:yacoode/ui/musics_list/widgets/custom_text.dart';
import 'package:yacoode/ui/musics_list/widgets/style.dart';
import '../../data/models/apis.dart';
import '../../data/toys_model.dart';
import '../../ui/musics_list/widgets/custom_navigation_btn.dart';

class AddPlayList extends StatefulWidget {
  const AddPlayList({super.key});
  @override
  State<AddPlayList> createState() => _AddPlayListState();
}

class _AddPlayListState extends State<AddPlayList>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    initializeSelectedItem();
    print(selectedItem);
    super.initState();
  }

  final TextEditingController nameArController =
      TextEditingController(); // late BuildContext context;

  List<String> itemlist = toys.map((item) => item['name'].toString()).toList();

  // List<String> itemlistIdList =
  //     toyslist.map((item) => {item}.toString()).toList();
  List<String> itemlistId = toys.map((item) => item['id'].toString()).toList();
  String? selectedItem;
  String? selectedItemId;
  String? newSelectedItems;
  List<bool> checkedItems = List.filled(15, false);
  List selectedItemLest = [];
  void initializeSelectedItem() {
    // selectedItem = itemlist[0].toString();
    selectedItem = itemlistName[0].toString();
    selectedItemId = itemlistId[0].toString();
  }

  // newSelectedItem(int i) {
  //   newSelectedItems = int.parse(itemlistId[i]).toString();
  //   print(newSelectedItems);
  // }
  newSelectedItem(int i) {
    newSelectedItems = int.parse(itemlistIdList[i]).toString();
    print(newSelectedItems);
  }

  String base64String = "";
  Uint8List? _image;
  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    base64String = base64.encode(img!); // asdfjaklsdfjl//asdfasd348309
    print(base64String);
    setState(() {
      _image = img;
    });
  }

  void addMedia() async {
    String namear = nameArController.text;
    // int selectedItemnumber = int.parse(str);
    final datas = {
      "toy_id": newSelectedItems,
      "media": selectedItemLest,
      "name": namear,
      "image": "data:image/png;base64,$base64String",
    };
    print(
        '---------------------selectedItemId--------------------------------$datas');
    myShowAlert(context, 'Wait', () {}, DialogType.error, Colors.red);

    // print('-----------------------------------------------------');
    // await postRequestAddMedia(myurl + myurlplaylist, datas, context);
    // print('-----------------------------------------------------');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(decoration: myBoxDecorationbg()),
        backgroundColor: const Color.fromARGB(255, 60, 37, 211),
        title: myHeaderText('Add Playlist'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: myBoxDecorationbg(),
        child: ListView(
          children: [
            mySizedBox(50),
            // Container(height: 200, child: MyStatefulWidget()),
            mySizedBox(24),
            theInput(nameArController, 'name', TextInputType.name, true),
            mySizedBox(24),
            // Center(
            //     child: DropdownButtonFormField<String>(
            //   value: selectedItem,
            //   items: itemlist
            //       .map((item) =>
            //           DropdownMenuItem(value: item, child: Text(item)))
            //       .toList(),
            //   onChanged: (item) => setState(() {
            //     selectedItem = item;
            //     // selectedItemId = item.toString();
            //     print(selectedItemId);

            //     newSelectedItem(itemlist.indexOf('$selectedItem'));
            //   }),
            // )),
            Center(
                child: DropdownButtonFormField<String>(
              value: selectedItem,
              items: itemlistName
                  .map((item) =>
                      DropdownMenuItem(value: item, child: Text(item)))
                  .toList(),
              onChanged: (item) => setState(() {
                selectedItem = item;
                // selectedItemId = item.toString();
                print(selectedItemId);

                // newSelectedItem(itemlist.indexOf('$selectedItem'));
                newSelectedItem(itemlistName.indexOf('$selectedItem'));
              }),
            )),
            mySizedBox(24),
            SizedBox(
                height: 100,
                child: ListView(children: [
                  // Container(height: 500, color: Colors.amber),
                  for (int i = 0; i < itemlist.length; i++)
                    CheckboxListTile(
                      title: Text(itemlist[i]),
                      value: checkedItems[i],
                      onChanged: (value) {
                        setState(() {
                          checkedItems[i] = value!;
                          selectedItemLest.add(itemlistId[i]);
                          print('itemlist[i]: ${itemlist[i]}');
                          print('selectedItemLest: $selectedItemLest');
                          print(checkedItems);
                        });
                      },
                    ),

                  // value: checkedItems,
                  // items: itemlist
                  //     .map((item) =>
                  //         DropdownMenuItem(value: item, child: Text(item)))
                  //     .toList(),

                  // onChanged: (item) => setState(() {
                  //   selectedItem = item;
                  //   // selectedItemId = item.toString();
                  //   print(selectedItemId);

                  //   newSelectedItem(itemlist.indexOf('$selectedItem'));
                  // }),
                ])),
            mySizedBox(24),

            _image != null
                ? InkWell(
                    onTap: selectImage,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      height: 300,
                      child: Image.memory(_image!),
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
            mySizedBox(24),
            myElevatedButton('add Playlist', addMedia),
            // MyNBtn(
            //   onPressed: addMedia, // Pass the button press function
            // ),
            mySizedBox(24),
          ],
        ),
      ),
    );
  }
}

Future<void> postRequestAddMedia(
    String url, Map<String, dynamic> data, context) async {
  final encodedData = jsonEncode(data);
  final response = await http.post(
    Uri.parse(url),
    headers: theHeader,
    body: encodedData,
  );
  if (response.statusCode == 200) {
    print(
        'Request sent successfully2222222222222222222222222222222222222222222222. Response: ${response.body}');
    AwesomeDialog(
      context: context,
      animType: AnimType.topSlide,
      dialogType: DialogType.success,
      body: Center(
        child: Text(
          jsonDecode(response.body.toString())['message'],
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      title: 'This is Ignored',
      desc: 'This is also Ignored',
      btnOkOnPress: () {},
    ).show();
  } else {
    print(
        'Error sending request55555555555555555555555555555555555555555555555: ${response.statusCode} ');
    AwesomeDialog(
            context: context,
            animType: AnimType.bottomSlide,
            dialogType: DialogType.error,
            body: Center(
              child: Text(
                jsonDecode(response.body.toString())['message'],
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            title: 'This is Ignored',
            desc: 'This is also Ignored',
            btnOkOnPress: () {},
            btnOkColor: Colors.red)
        .show();
  }
  print('body------------------------------------------------: ${encodedData}');
  print(response.body);
  print(jsonDecode(response.body.toString())['message']);
}
