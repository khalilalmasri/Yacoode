import 'package:flutter/material.dart';
import 'package:yacoode/data/models/apis.dart';
import 'package:yacoode/data/toys_model.dart';
import 'package:yacoode/ui/musics_list/widgets/style.dart';
import '../musics_list/widgets/custom_app_bar.dart';
import '../musics_list/widgets/custom_card.dart';

class AllToysList extends StatefulWidget {
  const AllToysList({super.key});

  @override
  State<AllToysList> createState() => _AllToysListState();
}

@override
void initState() {}

class _AllToysListState extends State<AllToysList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("Toys"),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              decoration: myBoxDecorationbg(),
              child: ListView(
                children: [
                  ...List.generate(
                      toys.length,
                      (index) => InkWell(
                              child: MyCard(
                            name: toys[index]['name'].toString(),
                            imageUrl: (toys[index]['image'] == null)
                                ? alert
                                : toys[index]['image'].toString(),
                            playlistId: toys[index]['id'].toString(),
                            // audioUrl:
                            // '${toys[index]['description']}${toys[index]['rfid_text']}__${toys[index]['rfid_code']}',
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
