import 'package:flutter/material.dart';
import 'package:yacoode/data/models/apis.dart';
import 'package:yacoode/data/models/music_model.dart';
import 'package:yacoode/data/toys_model.dart';
import 'package:yacoode/ui/musics_list/widgets/style.dart';
import 'package:yacoode/ui/toys/toys_list.dart';

import '../musics_list/all_play_list.dart';
import '../musics_list/widgets/custom_row_btn.dart';

class SplashHomePage extends StatefulWidget {
  const SplashHomePage({super.key});

  @override
  State<SplashHomePage> createState() => _SplashHomePageState();
}

class _SplashHomePageState extends State<SplashHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    ));

    // Start the animation
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: myBoxDecorationbg(),
        child: Center(
            child: Column(
          children: [
            const Spacer(),
            SlideTransition(
              position: _slideAnimation,
              child: InkWell(
                onTap: () {
                  goToAllPlayList(context);
                  setState(() {});
                },
                child: customRow('assets/Buddy-Music-Alpha.png', 'Music'),
              ),
            ),
            const Spacer(),
            SlideTransition(
              position: _slideAnimation,
              child: InkWell(
                onTap: () {
                  goToAllToysList(context);
                  setState(() {});
                },
                child: customRow('assets/Buddy-Box-Alpha.png', 'Toys'),
              ),
            ),
            const Spacer(),
          ],
        )),
      ),
    );
  }
}
goToAllToysList(context) async {
  // fetchData();

  await fetchDataallToys();
  Navigator.push(
    // ignore: use_build_context_synchronously
    context,
    MaterialPageRoute(
      builder: (context) => FutureBuilder(
        future: fetchDataallToys(),
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
            return const AllToysList();
          }
        },
      ),
    ),
    // (Route<dynamic> route) => false,
  );
}
goToAllPlayList(context) async {
  // fetchData();

  await fetchDataallPlayList();
  Navigator.push(
    // ignore: use_build_context_synchronously
    context,
    MaterialPageRoute(
      builder: (context) => FutureBuilder(
        future: fetchDataallPlayList(),
        // future: feach(),
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
    // (Route<dynamic> route) => false,
  );
}