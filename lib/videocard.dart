import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class videocard extends StatelessWidget {
  videocard(
      {required this.size,
      required this.controller,
      required this.title,
      required this.image,
      required this.personname});

  final Size size;
  final YoutubePlayerController? controller;
  final String? image;
  final String? title;
  final String? personname;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Container(
            height: size.height * .99,
            width: size.width * 1,
            child: YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: controller!,
                ),
                builder: (context, player) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: player,
                  );
                })),
      ),
      Positioned(
          bottom: 85,
          left: 25,
          child: Container(
            width: size.width * 0.9,
            child: Text(
              title!,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  decoration: TextDecoration.none),
            ),
          )),
      Positioned(
          bottom: 35,
          left: 25,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(image!),
          )),
      Positioned(
        bottom: 48,
        left: 80,
        child: Text(
          personname!,
          style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              decoration: TextDecoration.none),
        ),
      ),
    ]);
  }
}
