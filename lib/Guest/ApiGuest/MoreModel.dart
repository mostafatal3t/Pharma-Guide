// To parse this JSON data, do
//
//     final empty = emptyFromJson(jsonString);

import 'dart:convert';

more moreFromJson(String str) => more.fromJson(json.decode(str));

String moreToJson(more data) => json.encode(data.toJson());

class more {
  more({
    this.id,
    this.name,
    this.form,
    this.price,
    this.composition,
    this.uses,
    this.sideEffects,
    this.notUse,
  });

  int id;
  String name;
  String form;
  int price;
  List<Composition> composition;
  String uses;
  String sideEffects;
  String notUse;

  factory more.fromJson(Map<String, dynamic> json) => more(
    id: json["id"],
    name: json["name"],
    form: json["form"],
    price: json["price"],
    composition: List<Composition>.from(json["composition"].map((x) => Composition.fromJson(x))),
    uses: json["uses"],
    sideEffects: json["side_effects"],
    notUse: json["not_use"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "form": form,
    "price": price,
    "composition": List<dynamic>.from(composition.map((x) => x.toJson())),
    "uses": uses,
    "side_effects": sideEffects,
    "not_use": notUse,
  };
}

class Composition {
  Composition({
    this.name,
    this.size,
  });

  String name;
  String size;

  factory Composition.fromJson(Map<String, dynamic> json) => Composition(
    name: json["name"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "size": size,
  };
}
