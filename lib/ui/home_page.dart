import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  String _apiKey = "QGDapJeQOM1vcSc7MeQRsWduqXFstW5r";
  String _search;
  int _offset;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null) {
      response = await http.get(
        "https://api.giphy.com/v1/gifs/trending?" +
        "api_key=$_apiKey&limit=20&rating=g"
      );
    } else {
      response = await http.get(
        "https://api.giphy.com/v1/gifs/search?" +
        "api_key=$_apiKey&q=$_search&" +
        "limit=20&offset=$_offset&rating=g&lang=en"
      );
    }

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getGifs().then((map) => {
      print(map)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GIF Finder"),
      ),
      body: Column(),
    );
  }
}
