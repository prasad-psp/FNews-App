// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    required this.category,
    required this.data,
    required this.success,
  });

  String category;
  List<Datum> data;
  bool success;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        category: json["category"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
      };
}

class Datum {
  Datum({
    required this.author,
    required this.content,
    this.date,
    required this.id,
    required this.imageUrl,
    this.readMoreUrl,
    required this.time,
    required this.title,
    required this.url,
  });

  String author;
  String content;
  String? date;
  String id;
  String imageUrl;
  String? readMoreUrl;
  String time;
  String title;
  String url;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        author: json["author"],
        content: json["content"],
        date: json["date"].toString(),
        id: json["id"],
        imageUrl: json["imageUrl"],
        readMoreUrl: json["readMoreUrl"] == null ? null : json["readMoreUrl"],
        time: json["time"],
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "content": content,
        "date": dateValues.reverse[date],
        "id": id,
        "imageUrl": imageUrl,
        "readMoreUrl": readMoreUrl == null ? null : readMoreUrl,
        "time": time,
        "title": title,
        "url": url,
      };
}

enum Date { THE_11_OCT_2022_TUESDAY, THE_12_OCT_2022_WEDNESDAY }

final dateValues = EnumValues({
  "11 Oct 2022,Tuesday": Date.THE_11_OCT_2022_TUESDAY,
  "12 Oct 2022,Wednesday": Date.THE_12_OCT_2022_WEDNESDAY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
