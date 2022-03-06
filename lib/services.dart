import 'package:flutter/material.dart';
import 'package:internship/Shortsmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class apiFetcher {
  Future<List<Shortmodel>> getYoutubeshorts() async {
    Uri url = Uri.parse(
        "https://api.bottomstreet.com/socialMediaFeed?source=youtube");
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      List info = jsonDecode(response.body);
      return info.map((data) => new Shortmodel.fromJson(data)).toList();
    } else
      throw Exception("Unexpected Error Occured");
  }
}
