import 'package:flutter/material.dart';
import 'package:internship/Shortsmodel.dart';
import 'package:internship/services.dart';
import 'package:internship/splashscreen.dart';
import 'package:internship/videocard.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class shortContainer extends StatefulWidget {
  shortContainer();

  @override
  State<shortContainer> createState() => _shortContainerState();
}

class _shortContainerState extends State<shortContainer> {
  YoutubePlayerController? _controller;
  PageController _pageController = PageController(initialPage: 0);
  Future<List<Shortmodel>>? info;
  apiFetcher _fetcher = apiFetcher();
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    info = _fetcher.getYoutubeshorts();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      child: FutureBuilder<List<Shortmodel>>(
          future: info,
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return SplashScreen();
            } else {
              List<Shortmodel>? data = snapshot.data;

              return PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  itemCount: data!.length,
                  itemBuilder: ((context, index) {
                    controller(data[index].link);
                    return videocard(
                      size: size,
                      controller: _controller,
                      title: data[index].title,
                      personname: data[index].person,
                      image: data[index].displayimage,
                    );
                  }));
              // return ;
            }
          })),
    );
  }

  void controller(String? url) {
    String? videoId;
    videoId = YoutubePlayer.convertUrlToId(url!); // BBAyRBTfsOU
    _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: YoutubePlayerFlags(hideThumbnail: false, autoPlay: true));
  }
}
