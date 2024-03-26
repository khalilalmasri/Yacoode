import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../data/models/music_model.dart';

import 'my_play_list.dart';
import 'widgets/style.dart';

class AllPlayListPage extends StatefulWidget {
  const AllPlayListPage({super.key});

  @override
  State<AllPlayListPage> createState() => _AllPlayListPageState();
}

@override
void initState() {
  // musicsIdInk = musicsIdInk;
  // fetchDataallPlayList();
}

class _AllPlayListPageState extends State<AllPlayListPage> {
  String currentPlayListId = '';
  final player = AudioPlayer();

  Future<void> playAudioFromUrl(String url) async {
    await player.play(UrlSource(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: myBoxDecorationbg(),
        ),
        title: const Text("Buddy All Playlist"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            // if (!isOpened)
            Container(
              decoration: myBoxDecorationbg(),
              child: ListView(
                children: [
                  ...List.generate(
                      allPlayList.length,
                      (index) => InkWell(
                          onTap: () async {
                            currentPlayListId =
                                allPlayList[index]['id'].toString();
                            await fetchDataPlayIp(currentPlayListId);
                            Navigator.push(
                              // ignore: use_build_context_synchronously
                              context,
                              PageRouteBuilder(
                                transitionDuration: const Duration(seconds: 1),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        FutureBuilder(
                                  future: fetchDataPlayIp(currentPlayListId),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return const MusicsListPagen();
                                    } else {
                                      return const MusicsListPagen();
                                    }
                                    //   return Center(
                                    //     child: CircularProgressIndicator(
                                    //       strokeWidth: 5,
                                    //       strokeAlign: 10,
                                    //     ),
                                    //   );
                                    // }
                                  },
                                ),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(
                                      0.0, -1.0); // الانتقال من الجهة اليمنى
                                  const end = Offset
                                      .zero; // الانتقال إلى الوضع الافتراضي
                                  const curve =
                                      Curves.bounceOut; // الانتقال بشكل سلس
                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  var offsetAnimation = animation.drive(tween);

                                  return SlideTransition(
                                    position: offsetAnimation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                            setState(() {});
                          },
                          child: MyCard(
                            name: allPlayList[index]['name'].toString(),
                            imageUrl: (allPlayList[index]['playlist_image'] ==
                                    null)
                                ? 'https://www.udacity.com/blog/wp-content/uploads/2021/02/img8.png'
                                : allPlayList[index]['playlist_image']
                                    .toString(),
                            playlistId: allPlayList[index]['id'].toString(),
                            audioUrl: allPlayList[index]['url'].toString(),
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
