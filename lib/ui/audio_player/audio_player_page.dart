import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yacoode/ui/musics_list/widgets/custom_text.dart';

import '../../data/models/apis.dart';
import '../../data/models/music_model.dart';
import '../musics_list/widgets/custom_app_bar.dart';
import '../musics_list/widgets/style.dart';

bool isUrlHaveSong = true;
bool isPlaying = false;
String errorMassageUrl = 'No song';
int thenewindex = 0;
comp(int p, int w, List q, void f()) {
  if (p == q.length - 1) {
    p = 0;
  } else {
    p = ++w;
  }
  f();
}

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
    widget
        .playAudioFromUrl(musicsId[widget.index]['url'].toString())
        .then((_) => getMaxDurationstart());

    // setState(() {});

    super.initState();
  }

  getMaxDurationstart() {
    widget.player.getDuration().then((value) {
      maxDuration = value ?? const Duration(seconds: 0);
      setState(() {});
    });
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
        title: myHeaderText('Buddy Player'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        decoration: myBoxDecorationbg(),
        child: ListView(
          children: [
            const SizedBox(height: 60),
            Center(
                child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  (musicsId[widget.index]['media_image'].toString() != 'null' &&
                          musicsId[widget.index]['media_image'].toString() !=
                              'null'
                      ? musicsId[widget.index]['media_image'].toString()
                      : alert),
                  fit: BoxFit.cover,
                ),
              ),
            )),
            const SizedBox(height: 60),
            Text(musicsId[widget.index]['media_id'].toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20)),
            Text(musicsId[widget.index]['playlist_id'].toString(),
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
                      if (thenewindex == 0) {
                        thenewindex = musicsId.length - 1;
                        widget.index = musicsId.length - 1;
                      } else {
                        thenewindex = --widget.index;
                      }
                      print(
                          '===========######==============######==================$thenewindex from${musicsId.length - 1}');
                      widget
                          .playAudioFromUrl(
                              musicsId[thenewindex]['url'].toString())
                          .then((_) => getMaxDuration());
                    },
                    icon: const Icon(
                      Icons.skip_previous,
                      size: 36,
                      color: Colors.white,
                    )),
                IconButton(
                  onPressed: () {
                    isPlaying = !isPlaying;
                    widget.player.state == PlayerState.playing
                        ? widget.player.pause()
                        : widget.playAudioFromUrl(
                            musicsId[widget.index]['url'].toString());
                    getMaxDuration();
                  },
                  icon: isPlaying
                      ? const Icon(Icons.play_arrow)
                      : const Icon(Icons.pause),
                  iconSize: 35,
                  color: Colors.white,
                ),
                IconButton(
                    onPressed: () {
                      if (thenewindex == musicsId.length - 1) {
                        thenewindex = 0;
                        widget.index = 0;
                      } else {
                        thenewindex = ++widget.index;
                      }
                      print(
                          '===========######==============######==================$thenewindex from${musicsId.length - 1}');
                      widget
                          .playAudioFromUrl(
                              musicsId[thenewindex]['url'].toString())
                          .then((value) => getMaxDuration());
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
