import 'package:flutter/material.dart';
import 'package:internship/Shortscontainer.dart';
import 'package:internship/homePage.dart';
import 'package:internship/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YoutubeShorts',
      home: SplashScreen(),
    );
  }
}
