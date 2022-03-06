import 'package:flutter/material.dart';
import 'package:internship/Shortscontainer.dart';
import 'package:internship/Shortsmodel.dart';
import 'package:internship/services.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    // TODO: implement initState

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: shortContainer(),
    );
  }
}
