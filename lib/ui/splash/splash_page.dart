import 'package:flutter/material.dart';
import 'package:yacoode/ui/musics_list/all_play_list.dart';
import 'package:yacoode/ui/musics_list/widgets/style.dart';
import '../../data/models/music_model.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  toNextPage() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      // const AllPlayListPage()),
                      const AllPlayListPage()),
              (route) => false,
            ));
  }

  test() async {
    // fetchData();

    await fetchDataallPlayList();
    Navigator.pushAndRemoveUntil(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(
        builder: (context) => FutureBuilder(
          future: fetchDataallPlayList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  strokeAlign: 10,
                ),
              );
              // LinearProgressIndicator();
            } else {
              return const AllPlayListPage();
            }
          },
        ),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    // fetchData();

    fetchDataallPlayList();
    test();
    // toNextPage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: myBoxDecorationbg(),
        child: const Center(
          child: Text("BUDDY Home",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24)),
        ),
      ),
    );
  }
}
