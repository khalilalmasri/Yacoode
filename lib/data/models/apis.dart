import 'dart:convert';

import 'package:http/http.dart';

String myurl = 'https://yaacode.com/buddy/public/api/';
String myurlLogIn = 'auth/login';
String myurltoys = 'toys';
String myurlplaylist = 'playlist';
String myurlAddmedia = 'media';
String mturlToyList = 'toys/toys/list';
String myurlMediaList = 'media/media/list';
Map<String, String> theHeader = {
  'Content-Type': 'application/json',
  // 'Accept-Encoding': 'gzip, deflate, br',
  'Authorization':
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzhkNjQwN2U3YzJmYzFkYmZmY2MwZTJiNTEyY2Y2Nzc4NzMxMzBhM2JjOGIzYWZiNjQ5NGYxODgyM2UxZGM5OTkyMTc5MThlZjFiOWNmODUiLCJpYXQiOjE3MTE1NjAwNjQuMTA3NzE1LCJuYmYiOjE3MTE1NjAwNjQuMTA3NzE2LCJleHAiOjE3Mjc0NTc2NjQuMTA0MDU2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.OFqDvSdX5Zo-FWfK0PO27t61kGbVoJmiPy2bqdN5xBgH6ORUCKSilrS0udY_QC-oXgrFiVrVsAqmQG4rzah6i7F-7wrMn1M9ZIYMVKfdGvxydpkwzYc5xNU5_C4mWiZt8xaE2e5nojO-YfNUSuNrQbvgZfAePNJLfalgH9-WFTEvwUi2T-X5ehKYulA4rihAp44As2TfQFh3COTontfM6K6rwFUq4olLw8yoZDMUZy-n0IA2aUU8e-CtAG_i5Od_pqB_l2EKUS8BzpZxQUnvj96sql-JPW1PhzVbIq67xFXhznNwBOI09Ghq2Q0yoxxMld-o7T6svg9jSuMeaomjQuK7eJXlh8OWCZdfREq1U3lAQ3Jgez0elDjCRoIFktJKJkm1Yfifn3SEDgoy8cAc2iAMypxga-6au6OiNCFlpgxVa_eyGAQiH51jIOwATYxOtbTdq-QOwI9oYd5CAv1L530UKkEomWGdwYOgygH11Y-dvx8Xh7A_tjEV4Y81jxVTxVbRcZFU2dMhAJ9xCr10IAEtLOr7iZhbcK8qGT6m6-oCoPTULy7pLakldTd9_fniW57NrPyIESxdTlNJQeOhvQHqhm_fCkExdvT8dEXp4xgHhHbeXIFAtyWXrSH274L80rfgvgq1fcmcDCszlw9JLqKItcyv9STPC-qy7jRiSdc',
};
// String alert = 'https://www.udacity.com/blog/wp-content/uploads/2021/02/img8.png';
String alert =
    'https://yaacode.com/buddy//images/13afb671e4314aece71879ab0ce5ae48.png';

// toNextPage() {
//   Future.delayed(const Duration(seconds: 3))
//       .then((value) => Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(
//                 builder: (context) =>
//                     // const AllPlayListPage()),
//                     const AllPlayListPage()),
//             (route) => false,
//           ));
// }
// Future<void> postRequestAddMedia(
//   String url,
//   Map<String, dynamic> data,
// ) async {
//   final encodedData = jsonEncode(data);
//   final response = await http.post(
//     Uri.parse(url),
//     headers: theHeader,

//     body: encodedData,
//   );
//   if (response.statusCode == 200) {
//     print(
//         'Request sent successfully2222222222222222222222222222222222222222222222. Response: ${response.body}');
//     // AwesomeDialog(
//     //   context: context,
//     //   animType: AnimType.scale,
//     //   dialogType: DialogType.success,
//     //   body: const Center(
//     //     child: Text(
//     //       'If the body is specified, then title and description will be ignored, this allows to 											further customize the dialogue.',
//     //       style: TextStyle(fontStyle: FontStyle.italic),
//     //     ),
//     //   ),
//     //   title: 'This is Ignored',
//     //   desc: 'This is also Ignored',
//     //   btnOkOnPress: () {},
//     // ).show();
//   } else {
//     print(
//         'Error sending request55555555555555555555555555555555555555555555555: ${response.statusCode} ');
//   //   AwesomeDialog(
//   //     context: context,
//   //     animType: AnimType.scale,
//   //     dialogType: DialogType.info,
//   //     body: const Center(
//   //       child: Text(
//   //         'If the body is specified, then title and description will be ignored, this allows to 											further customize the dialogue.',
//   //         style: TextStyle(fontStyle: FontStyle.italic),
//   //       ),
//   //     ),
//   //     title: 'This is Ignored',
//   //     desc: 'This is also Ignored',
//   //     btnOkOnPress: () {},
//   //   ).show();
//   }
//   print('body------------------------------------------------: ${encodedData}');
//   print(response.body);
//   print(jsonDecode(response.body.toString())['message']);
// }
List medialist = [];
fetchDataMedialist() async {
  var response = await get(
    Uri.parse(myurl + myurlMediaList),
    headers: theHeader,
  );
  var responsbody = jsonDecode(response.body);

  print("medialist---------------------------: $medialist");
  print("responsbody---------------------------: $responsbody");
  return medialist = responsbody["data"];
}

// fillMedialist() async {
//   await fetchDataMedialist();
//   itemlistNameMedia.clear();
//   itemlistIdListMedia.clear();

//   for (Map<String, dynamic> item in toyslist) {
//     String name = item.values.first;
//     itemlistName.add(name);
//   }
//   for (Map<String, dynamic> item in toyslist) {
//     String id = item.keys.first;
//     itemlistIdList.add(id);
//   }
//   print('itemlistIdList: $itemlistIdList');
//   print('itemlistName: $itemlistName');
// }