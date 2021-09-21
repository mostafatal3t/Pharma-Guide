// To parse this JSON data, do
//
//     final image = imageFromJson(jsonString);
import 'package:http/http.dart' as http;
import 'dart:convert';

Image2 imageFromJson(String str) => Image2.fromJson(json.decode(str));

String imageToJson(Image2 data) => json.encode(data.toJson());

class Image2 {
  Image2({
    this.image,
    this.ex,
  });

  String image;
  String ex;

  factory Image2.fromJson(Map<String, dynamic> json) => Image2(
    image: json["image"],
    ex: json["ex"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "ex": ex,
  };
}
