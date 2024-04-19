// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:yacoode/data/models/apis.dart';
import 'package:yacoode/ui/musics_list/widgets/custom_alert.dart';

late File audioFile;
String base64String = "";
String base64StringAudio = "";
String audioFileName = "";
Uint8List? image;
bool sw = false;
final TextEditingController nameArController = TextEditingController();
final TextEditingController nameEnController = TextEditingController();
final TextEditingController contentArController = TextEditingController();
final TextEditingController contentEnController = TextEditingController();
final TextEditingController descriptionArController = TextEditingController();
final TextEditingController descriptionEnController = TextEditingController();
final TextEditingController priceController = TextEditingController();
final TextEditingController newPriceController = TextEditingController();
List addTextForm = [
  [nameArController, 'name arabic', TextInputType.name, true],
  [nameEnController, 'name english', TextInputType.name, true],
  [contentArController, 'content arabic', TextInputType.name, true],
  [contentEnController, 'content English', TextInputType.name, true],
  [descriptionArController, 'description arabic', TextInputType.name, true],
  [descriptionEnController, 'description english', TextInputType.name, true],
  [priceController, 'price = 0', TextInputType.number, false],
  [newPriceController, 'new price', TextInputType.number, true],
];
cleaField() {
  nameArController.clear();
  nameEnController.clear();
  contentArController.clear();
  contentEnController.clear();
  descriptionArController.clear();
  descriptionEnController.clear();
  priceController.clear();
  newPriceController.clear();
  sw = false;
  image = null;
}

String message = '';
Future<void> postRequestAddMedia(
    String url, Map<String, dynamic> data, context) async {
  try {
    final encodedData = jsonEncode(data);
    final response = await http.post(
      Uri.parse(url),
      headers: theHeader,
      body: encodedData,
    );
    message = jsonDecode(response.body.toString())['message'];

    if (response.statusCode == 200) {
      // final responseData = jsonDecode(response.body);
      print('Request sent successfully. Response: $message');
      myShowAlert(context, message, () {}, DialogType.success, Colors.green);
      cleaField();
    } else {
      throw Exception('Error sending request: $message');
    }
  } on FormatException catch (e) {
    print('Error decoding response: $e');
    myShowAlert(context, message, () {}, DialogType.error, Colors.red);
  } catch (e) {
    print('Error sending request: $e');
    myShowAlert(context, message, () {}, DialogType.error, Colors.red);
  }
}
