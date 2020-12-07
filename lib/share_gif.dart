import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class ShareGif {
  static void share(Map<String, dynamic> image) async {
    _downloadFile(
        image["images"]["fixed_height"]["url"],
        image["images"]["original"]["hash"] + ".gif"
    ).then((file) => {
      Share.shareFiles(
          [file.path],
          text: image["title"] +
            "\nFind and share gifs with this awesome app!" +
            "\nDownload here: [link]"
      )
    });
  }

  static var _httpClient = new HttpClient();
  static Future<File> _downloadFile(String url, String filename) async {
    var request = await _httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }
}