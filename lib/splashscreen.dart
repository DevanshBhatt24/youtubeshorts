import 'package:flutter/material.dart';
import 'package:internship/homePage.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
    // navigateUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff84ceff),
        ),
        child: Center(
          child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Lottie.asset("assets/animation/88994-music-time.json",
                  controller: _controller, onLoaded: (composition) {
                _controller.addStatusListener((status) {
                  if (status == AnimationStatus.completed) {
                    navigateUser();
                  }
                });
                _controller
                  ..duration = composition.duration
                  ..forward();
              })),
        ),
      ),
    );
  }

  void navigateUser() {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => homepage()));
  }
}
