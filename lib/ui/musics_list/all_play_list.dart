// ignore_for_file: use_build_context_synchronously

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:yacoode/data/models/apis.dart';
import 'package:yacoode/form_music/resources/form_playlist.dart';
import '../../data/models/music_model.dart';
import '../../data/toys_model.dart';
import 'my_play_list.dart';
import 'widgets/custom_card.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/style.dart';

class AllPlayListPage extends StatefulWidget {
  const AllPlayListPage({super.key});

  @override
  State<AllPlayListPage> createState() => _AllPlayListPageState();
}

@override
class _AllPlayListPageState extends State<AllPlayListPage> {
  String currentPlayListId = '';
  final player = AudioPlayer();
  void initState() {
    // musicsIdInk = musicsIdInk;
    // fetchDataallPlayList();
    // fetchDataToyslist();
    // fetchDataallToys();
    fillToylist();
    fetchDataMedialist();
    super.initState();
  }

  Future<void> playAudioFromUrl(String url) async {
    await player.play(UrlSource(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("Buddy All Playlist"),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: firstGradientColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPlayList()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
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
                                    //       strokeWidth: 5,strokeAlign: 10,),);}
                                  },
                                ),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(0.0, -1.0);
                                  const end = Offset.zero;
                                  const curve = Curves.bounceOut;
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
                            imageUrl:
                                (allPlayList[index]['playlist_image'] == null)
                                    ? alert
                                    : allPlayList[index]['playlist_image']
                                        .toString(),
                            playlistId: allPlayList[index]['id'].toString(),
                            // audioUrl: allPlayList[index]['url'].toString(),
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
