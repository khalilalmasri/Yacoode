import 'dart:convert';
import 'package:http/http.dart';
import 'package:yacoode/data/models/apis.dart';

List toys = [
  {
    'id': '9',
    'image':
        'https://yaacode.com/buddy//images/2a43705c1855b16c0c10e4cd0461d115.jpeg',
    'name': 'لعبة جديدة,',
    'description': "لعبة جديدة,",
    "price": "98.00",
    "rfid_text": "9898931",
    "rfid_code": "989893",
    "toy_model_id": "1",
    "toy_model_name": "Toy Model"
  },
];
List toyslist = [
  {'1': ' لعبة فلة'},
  {'2': ' لعبة سندريلا'},
  {'3': ' لعبة موكلي'},
];
List<String> itemlistName = [];
List<String> itemlistIdList = [];

fetchDataallToys() async {
  var response = await get(
    Uri.parse(myurl + myurltoys),
    headers: theHeader,
  );
  var responsbody = jsonDecode(response.body);
  print(responsbody['data']);
  return toys = responsbody["data"];
}

fetchDataToyslist() async {
  var response = await get(
    Uri.parse(myurl + mturlToyList),
    headers: theHeader,
  );
  var responsbody = jsonDecode(response.body);

  print("toyslist: $toyslist");
  return toyslist = responsbody["data"];
}

fillToylist() async {
  await fetchDataToyslist();
  itemlistName.clear();
  itemlistIdList.clear();

  for (Map<String, dynamic> item in toyslist) {
    String name = item.values.first;
    itemlistName.add(name);
  }
  for (Map<String, dynamic> item in toyslist) {
    String id = item.keys.first;
    itemlistIdList.add(id);
  }
  print('itemlistIdList: $itemlistIdList');
  print('itemlistName: $itemlistName');
}
