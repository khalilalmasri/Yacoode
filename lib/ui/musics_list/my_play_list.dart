// ignore: file_names
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../data/models/music_model.dart';
import '../audio_player/audio_player_page.dart';
import 'widgets/style.dart';

class MusicsListPagen extends StatefulWidget {
  const MusicsListPagen({super.key});

  @override
  State<MusicsListPagen> createState() => _MusicsListPagenState();
}

@override
void initState() {
  // fetchData();
}

class _MusicsListPagenState extends State<MusicsListPagen> {
  int currentMusic = 0;

  String currentMusicurl = '';

  final player = AudioPlayer();
  late String url;
  bool isOpened = isOpen;
  Future<void> playAudioFromUrl(String url) async {
    await player.play(UrlSource(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(decoration: myBoxDecorationbg()),
          title: const Text("BUddy"),
          centerTitle: true,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              if (!isOpened)
                Container(
                  decoration: myBoxDecorationbg(),
                  child: ListView(
                    children: [
                      ...List.generate(
                          musicsId.length,
                          (index) => InkWell(
                              onTap: () {
                                currentMusic = index;
                                fillListId(
                                    musicsId[index]['media_id'].toString(),
                                    musicsId[index]['media_image'].toString(),
                                    musicsId[index]['playlist_id'].toString(),
                                    musicsId[index]['url'].toString());

                                turnSwitch();
                                isOpened = isOpen;
                                fetchDataPlayIp(musicsId[index]['playlist_id']);

                                setState(() {});
                              },
                              child: MyCard(
                                name: musicsId[index]['media_id'].toString(),
                                // imageUrl: (index.isEven)
                                imageUrl: (musicsId[index]['media_image']
                                            .toString() ==
                                        'null')
                                    // ? 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgrHboTd5Da4QhuyKxlisU1dRY7bc-QZi6ooxfeBPnWDJ-ieaVE8RifHK1sjZ33bdh0Tu3HHNM6XLFOwg7Zfj6xhifNms5yECVg22qhTkOnotzTZQbHuvhVY27IksyrhsZ28GM1ljsvX7gyIeH1cMaqxRhTyqfVL7sB75Qv6Nwj92z31BIWK9hXuBx0o8Ij/s3456/%D8%B5%D9%88%D8%B1-%D9%88%D8%B1%D8%AF-%D8%AC%D9%85%D9%8A%D9%84%D8%A9%20(43).jpg'
                                    ? 'https://www.udacity.com/blog/wp-content/uploads/2021/02/img8.png'
                                    : musicsId[index]['media_image'].toString(),
                                playlistId:
                                    musicsId[index]['playlist_id'].toString(),
                                audioUrl: musicsId[index]['url'].toString(),
                              )))
                    ],
                  ),
                ),
            ],
          ),
        ),
        bottomNavigationBar: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.bounceOut,
            height: isOpened ? MediaQuery.of(context).size.height : 100,
            width: MediaQuery.of(context).size.width,
            decoration: myBoxDecorationbg(),
            padding: const EdgeInsets.all(16),
            child: isOpened
                ? SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: AudioPlayerPagen(
                        onTap: () {
                          // isOpened = !isOpened;
                          turnSwitch();
                          isOpened = isOpen;
                          setState(() {});
                        },
                        index: currentMusic,
                        player: player,
                        // music: musics[currentMusic],
                        // music: musicsId[currentMusic]['url']
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      // isOpened = !isOpened;
                      turnSwitch();
                      isOpened = isOpen;
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      // musicsIdInk == null ||
                                      musicsIdInk[0]['media_image']
                                                  .toString() ==
                                              'null'
                                          ? 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjbhBFhIQQ3FDLJkEavTSwUiCeeaAxbblI4LUBEyKGeRcmzjaixSDnf31gk0S9BGqwEGwwgpi714lTSnFq9K1RaY1jTT2vf2lU4Nr24T_J8IDNFWBAMorbPjRF-G_7E-buEpM7BOM-U8ornF8ua6Y05ibYD_0bwUsxx2JR_H_N6-0xjq9YtIhUdikzG2MjT/s1080/%D8%B5%D9%88%D8%B1-%D9%88%D8%B1%D8%AF-%D8%AC%D9%85%D9%8A%D9%84%D8%A9.jpg'
                                          : musicsIdInk[0]['media_image']
                                              //  musicsId[currentMusic]['media_image']
                                              .toString()),
                                  // 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjbhBFhIQQ3FDLJkEavTSwUiCeeaAxbblI4LUBEyKGeRcmzjaixSDnf31gk0S9BGqwEGwwgpi714lTSnFq9K1RaY1jTT2vf2lU4Nr24T_J8IDNFWBAMorbPjRF-G_7E-buEpM7BOM-U8ornF8ua6Y05ibYD_0bwUsxx2JR_H_N6-0xjq9YtIhUdikzG2MjT/s1080/%D8%B5%D9%88%D8%B1-%D9%88%D8%B1%D8%AF-%D8%AC%D9%85%D9%8A%D9%84%D8%A9.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // musicsId[currentMusic]
                              musicsIdInk[0]['media_id'].toString(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            Text(
                              'musicsId[currentMusic][playlist_id]',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white.withOpacity(0.7)),
                            ),
                          ],
                        ),
                        Center(
                          child: IconButton(
                              onPressed: () {
                                player.state == PlayerState.playing
                                    ? player.pause()
                                    : playAudioFromUrl(musicsIdInk[0]
                                            // musicsId[currentMusic]
                                            ['url']
                                        .toString());
                                player.state != PlayerState.playing;
                                setState(() {});
                              },
                              icon: Icon(
                                player.state == PlayerState.playing
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                size: 40,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                  )));
  }
}
