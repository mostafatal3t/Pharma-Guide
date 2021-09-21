// To parse this JSON data, do
//
//     final mydrugs = mydrugsFromJson(jsonString);

import 'dart:convert';

List<Mydrugs> mydrugsFromJson(String str) => List<Mydrugs>.from(json.decode(str).map((x) => Mydrugs.fromJson(x)));

String mydrugsToJson(List<Mydrugs> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mydrugs {
  Mydrugs({
    this.id,
    this.name,
    this.form,
    this.price,
  });

  int id;
  String name;
  String form;
  double price;

  factory Mydrugs.fromJson(Map<String, dynamic> json) => Mydrugs(
    id: json["id"],
    name: json["name"],
    form: json["form"],
    price: json["price"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "form": form,
    "price": price,
  };
}
