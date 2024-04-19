import 'package:flutter/material.dart';
import 'package:yacoode/ui/musics_list/widgets/style.dart';

// class CustomAppBar extends StatelessWidget {
//   final String title;
//   const CustomAppBar({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//       flexibleSpace: Container(
//         decoration: myBoxDecorationbg(),
//       ),
//       title: Text(title),
//       centerTitle: true,
//     ));
//   }
// }
customAppbar(String title) {
  return 
      AppBar(
    flexibleSpace: Container(
      decoration: myBoxDecorationbg(),
    ),
    title: Text(title),
    centerTitle: true,
  );
}