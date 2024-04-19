import 'package:flutter/material.dart';
import 'package:yacoode/ui/musics_list/widgets/style.dart';

class MyCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  // final String audioUrl;
  final String playlistId;

  const MyCard({
    super.key,
    required this.name,
    required this.imageUrl,
    // required this.audioUrl,
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/Buddy-Music-Alpha.png'),
                    );
                  },
                ),
              ),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(10.0),
              //   child:
              //   Image.network(
              //     imageUrl,
              //     width: 100,
              //     height: 100,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              const SizedBox(width: 15),
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
                      'id: $playlistId',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    // Text(
                    //   'Other: ',
                    //   // 'Other: $audioUrl',
                    //   style: const TextStyle(
                    //     fontSize: 10,
                    //   ),
                    // ),
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
