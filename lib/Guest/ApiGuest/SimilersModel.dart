
import 'dart:convert';

List<Similer> SimilerFromJson(String str) => List<Similer>.from(json.decode(str).map((x) => Similer.fromJson(x)));

String SimilerToJson(List<Similer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Similer {
  Similer({
    this.id,
    this.name,
    this.form,
    this.price,
  });

  int id;
  String name;
  String form;
  double price;

  factory Similer.fromJson(Map<String, dynamic> json) => Similer(
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
