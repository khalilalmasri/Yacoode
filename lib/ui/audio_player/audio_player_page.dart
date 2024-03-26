import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../data/models/music_model.dart';
import '../musics_list/widgets/style.dart';

bool isUrlHaveSong = true;
String errorMassageUrl = 'No song';

// ignore: must_be_immutable
class AudioPlayerPagen extends StatefulWidget {
  // MusicModel music;
  AudioPlayer player;
  int index;
  VoidCallback onTap;

  AudioPlayerPagen(
      {required this.index,
      required this.player,
      // required this.music,
      required this.onTap,
      super.key});
  Future<void> playAudioFromUrl(String url) async {
    try {
      await player.play(UrlSource(url));
    } catch (e) {
      // ignore: avoid_print
      print('Error playing audio.............................: $e');
      isUrlHaveSong = false;
    }  
  }

  @override
  State<AudioPlayerPagen> createState() => _AudioPlayerPagenState();
}

class _AudioPlayerPagenState extends State<AudioPlayerPagen> {
  Duration maxDuration = const Duration(seconds: 0);
  late ValueListenable<Duration> progress;

  @override
  void initState() {
    widget.playAudioFromUrl(
        // musicsId[widget.index]
        musicsIdInk[0]['url'].toString());

    setState(() {});
    // widget.player.state = PlayerState.playing;
    // setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getMaxDuration() {
      widget.player.getDuration().then((value) {
        maxDuration = value ?? const Duration(seconds: 0);
        setState(() {});
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: widget.onTap,
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        flexibleSpace: Container(decoration: myBoxDecorationbg()),
        backgroundColor: const Color.fromARGB(255, 60, 37, 211),
        title: const Text(
          "Budy Player",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        decoration: myBoxDecorationbg(),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          // musicsId[widget.index]
                          musicsIdInk[0]['media_image'].toString() != 'null' &&
                                  musicsId[widget.index]['media_image']
                                          .toString() !=
                                      'null'
                              ? musicsId[widget.index]['media_image'].toString()
                              : 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjbhBFhIQQ3FDLJkEavTSwUiCeeaAxbblI4LUBEyKGeRcmzjaixSDnf31gk0S9BGqwEGwwgpi714lTSnFq9K1RaY1jTT2vf2lU4Nr24T_J8IDNFWBAMorbPjRF-G_7E-buEpM7BOM-U8ornF8ua6Y05ibYD_0bwUsxx2JR_H_N6-0xjq9YtIhUdikzG2MjT/s1080/%D8%B5%D9%88%D8%B1-%D9%88%D8%B1%D8%AF-%D8%AC%D9%85%D9%8A%D9%84%D8%A9.jpg'),
                      // musicsId[widget.index % musics.length].cover,
                      // 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjbhBFhIQQ3FDLJkEavTSwUiCeeaAxbblI4LUBEyKGeRcmzjaixSDnf31gk0S9BGqwEGwwgpi714lTSnFq9K1RaY1jTT2vf2lU4Nr24T_J8IDNFWBAMorbPjRF-G_7E-buEpM7BOM-U8ornF8ua6Y05ibYD_0bwUsxx2JR_H_N6-0xjq9YtIhUdikzG2MjT/s1080/%D8%B5%D9%88%D8%B1-%D9%88%D8%B1%D8%AF-%D8%AC%D9%85%D9%8A%D9%84%D8%A9.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 60),
            Text(
                // musicsId[widget.index]
                isUrlHaveSong
                    ? musicsId[widget.index]['media_id'].toString()
                    : errorMassageUrl,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20)),
            Text(
                // musicsId[widget.index
                //  % musicsId.length
                // ]
                // musicsIdInk[0]['playlist_id'].toString(),
                musicsId[widget.index]['playlist_id'].toString(),
                style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
            const SizedBox(height: 20),
            Text(musicsId[widget.index]['url'].toString(),
                style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontWeight: FontWeight.w600,
                    fontSize: 13)),
            const SizedBox(height: 30),
            StreamBuilder(
                stream: widget.player.onPositionChanged,
                builder: (context, snapshot) {
                  return ProgressBar(
                    progress: snapshot.data ?? const Duration(seconds: 0),
                    total: maxDuration,
                    onSeek: (duration) {
                      widget.player.seek(duration);
                      setState(() {});
                    },
                  );
                }),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      // print(',,,,,,,,,,,,,,,,,,,,,,,');
                      // print(widget);
                      widget.player.stop();
                      // print(musicsId[widget.index]);
                      // if (widget.index == 0) {
                      //   // print('stoooooooooooooop');
                      //   widget.playAudioFromUrl(musicsId[0]['url'].toString());
                      // } else {
                      widget.playAudioFromUrl(
                          musicsId[--widget.index]['url'].toString());
                      // }
                      getMaxDuration();
                    },
                    icon: const Icon(
                      Icons.skip_previous,
                      size: 36,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      widget.player.state == PlayerState.playing
                          ? widget.player.pause()
                          : widget.playAudioFromUrl(
                              // musicsId[widget.index]
                              musicsIdInk[0]['url'].toString());
                      // : widget.player.play(AssetSource(
                      //     musics[widget.index % musics.length].path));
                      getMaxDuration();
                      widget.player.state != PlayerState.playing;

                      setState(() {});
                    },
                    icon: Icon(
                      widget.player.state == PlayerState.playing
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 40,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      widget.player.stop();
                      if (widget.index == musicsId.length - 1) {
                        // print('stoooooooooooooop');
                        widget.playAudioFromUrl(musicsId[0]['url'].toString());
                      } else {
                        widget.playAudioFromUrl(
                            musicsId[++widget.index]['url'].toString());
                      }
                      getMaxDuration();

                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.skip_next,
                      size: 36,
                      color: Colors.white,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
