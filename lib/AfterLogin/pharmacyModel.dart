// To parse this JSON data, do
//
//     final searchDataModel = searchDataModelFromJson(jsonString);

import 'dart:convert';

List<SearchDataModel> searchDataModelFromJson(String str) => List<SearchDataModel>.from(json.decode(str).map((x) => SearchDataModel.fromJson(x)));

String searchDataModelToJson(List<SearchDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchDataModel {
  SearchDataModel({
    this.id,
    this.name,
    this.form,
    this.price,
    this.status,
  });

  int id;
  String name;
  String form;
  double price;
  String status;

  factory SearchDataModel.fromJson(Map<String, dynamic> json) => SearchDataModel(
    id: json["id"],
    name: json["name"],
    form: json["form"],
    price: json["price"].toDouble(),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "form": form,
    "price": price,
    "status": status,
  };
}
