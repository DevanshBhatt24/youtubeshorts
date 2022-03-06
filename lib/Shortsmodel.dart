import 'package:flutter/material.dart';

class Shortmodel {
  final String? displayimage;
  final String? link;
  final String? person;
  final String? title;

  Shortmodel({this.displayimage, this.link, this.person, this.title});

  factory Shortmodel.fromJson(Map<String, dynamic> json) {
    return Shortmodel(
        displayimage: json["display_image"],
        link: json["link"],
        person: json["source_page"],
        title: json["title"]);
  }
}
