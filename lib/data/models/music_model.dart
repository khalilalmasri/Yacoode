// ignore: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:yacoode/ui/musics_list/widgets/style.dart';

class MyCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String audioUrl;
  final String playlistId;

  const MyCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.audioUrl,
    required this.playlistId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myBoxDecorationbg(),
      child: Card(
        child: Container(
          decoration: myBoxDecorationbg(),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Name:$name',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'playlist_id: $playlistId',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Outher: $audioUrl',
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('My Card Example')),
      body: const Center(
        child: MyCard(
          name: 'John Doe',
          imageUrl: '',
          // "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjbhBFhIQQ3FDLJkEavTSwUiCeeaAxbblI4LUBEyKGeRcmzjaixSDnf31gk0S9BGqwEGwwgpi714lTSnFq9K1RaY1jTT2vf2lU4Nr24T_J8IDNFWBAMorbPjRF-G_7E-buEpM7BOM-U8ornF8ua6Y05ibYD_0bwUsxx2JR_H_N6-0xjq9YtIhUdikzG2MjT/s1080/%D8%B5%D9%88%D8%B1-%D9%88%D8%B1%D8%AF-%D8%AC%D9%85%D9%8A%D9%84%D8%A9.jpg",
          audioUrl:
              'https://yaacode.com/buddy//mp3/170964850965e72a7de4dd8.mp3',
          // 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3',
          playlistId: '',
        ),
      ),
    ),
  ));
}

List allPlayList = [
  // {"id": '20', "playlist_image": 'null', "name": "منوعات اغاني"},
];
List musicsn = [
  // {
  //   'media_id': '6',
  //   'playlist_id': '19',
  // 'url': "https://yaacode.com/buddy//mp3/170964850965e72a7de4dd8.mp3"
  // }
];
List musicsId = [
  // {
  //   "media_id": '2',
  //   "media_image": 'null',
  //   "playlist_id": '20',
  //   "url":"https://yaacode.com/buddy//home/yassermo/public_html/buddy/public/mp3/1709567238أغنية يا طيبة قناة هدهد - Hudhud.mp3"
  // },
];
List allPlayListInk = [
  // {
  //   "media_id": '2',
  //   "media_image": 'null',
  //   "playlist_id": '20',
  //   "url":"https://yaacode.com/buddy//home/yassermo/public_html/buddy/public/mp3/1709567238أغنية يا طيبة قناة هدهد - Hudhud.mp3"
// }
];
List musicsIdInk = [
  {
    "media_id": '2',
    "media_image": 'null',
    "playlist_id": '20',
    "url":
        "https://yaacode.com/buddy//home/yassermo/public_html/buddy/public/mp3/1709567238أغنية يا طيبة قناة هدهد - Hudhud.mp3"
  },
];
bool isOpen = false;
int currentMusicm = 0;
fetchData() async {
  var response = await get(Uri.parse(
      'https://yaacode.com/buddy/public/api/playlist/playlist-media/98989'));
  var responsbody = jsonDecode(response.body);
  // print(responsbody["data"]);
  return musicsn = responsbody["data"];
}

fetchDataallPlayList() async {
  var response =
      await get(Uri.parse('https://yaacode.com/buddy/public/api/playlist'));
  var responsbody = jsonDecode(response.body);
  // print(responsbody["data"]);
  return allPlayList = responsbody["data"];
}

fetchDataPlayIp(id) async {
  var response =
      await get(Uri.parse('https://yaacode.com/buddy/public/api/playlist/$id'));
  var responsbody = jsonDecode(response.body);
  // print('...................................');
  // print(responsbody);
  // print('...................................');
  return musicsId = responsbody["data"]["media"];
}

turnSwitch() {
  isOpen = !isOpen;
  // print('isOpen...................');
  // print(isOpen);
  // print('isOpen...............');
}

fillList(String mediaId, String mediaImage, String playlistId, String url) {
  // print('allPlayListInk,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,');
  allPlayListInk.add({mediaId, mediaImage, playlistId, url});
  // print('allPlayListInk,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,');
}

fillListId(String mediaId, String mediaImage, String playlistId, String url) {
  // print('musicsIdInk,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,');
  // print(musicsIdInk);
  musicsIdInk.clear();
  // print('musicsIdInk,,,,,,,,,,clear,,,,,,,,,,,,,,,,,,,,,,');
  // print(musicsIdInk);
  musicsIdInk.add({
    "media_id": mediaId,
    "media_image": mediaImage,
    "playlist_id": playlistId,
    "url": url
  });
  // print('musicsIdInk,,,,,,,,,,,add,,,,,,,,,,,,,,,,,,,,,');
  // print(musicsIdInk);
}
