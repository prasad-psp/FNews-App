import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as https;

import '../model/news_model.dart';

class ApiService {
  final _BASE_URL = "https://inshortsapi.vercel.app/news?category="; // sports

  // Status code
  final _SUCCESS_STATUS = 200;

  Future<NewsModel?> getNews(String newsType) async {
    debugPrint("new types is $newsType");
    var client = https.Client();
    var response = await client.get(Uri.parse(_BASE_URL + newsType));

    if (response.statusCode == _SUCCESS_STATUS) {
      var json = response.body;
      return newsModelFromJson(json);
    }
    return null;
  }
}
