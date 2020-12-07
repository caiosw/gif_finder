import 'package:flutter/material.dart';
import 'package:gif_finder/share_gif.dart';

class GifPage extends StatelessWidget {

  final Map _gifData;

  GifPage(this._gifData);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_gifData["title"]),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              ShareGif.share(_gifData);
            }
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(_gifData["images"]["fixed_height"]["url"]),
      ),
    );
  }
}
