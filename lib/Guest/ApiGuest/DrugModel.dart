// // To parse this JSON data, do
// //
// //     final empty = emptyFromJson(jsonString);
//
// import 'dart:convert';
// Drug DrugFromJson(String str) => Drug.fromJson(json.decode(str));
//
// String DrugToJson(Drug data) => json.encode(data.toJson());
//
// class Drug {
//   Drug({
//     this.data,
//   });
//
//   List<Datum> data;
//   factory Drug.fromJson(Map<String, dynamic> json) => Drug(
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   };
// }
//
// class Datum {
//   Datum({
//     this.id,
//     this.name,
//     this.form,
//     this.price,
//
//   });
//
//   int id;
//   String name;
//   String form;
//   double price;
//
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["id"],
//     name: json["name"],
//     form: json["form"],
//     price: json["price"].toDouble(),
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "form": form,
//     "price": price,
//   };
// }
import 'dart:convert';

List<Drug> DrugFromJson(String str) => List<Drug>.from(json.decode(str).map((x) => Drug.fromJson(x)));

String DrugToJson(List<Drug> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Drug {
  Drug({
    this.id,
    this.name,
    this.form,
    this.price,
  });

  int id;
  String name;
  String form;
  double price;

  factory Drug.fromJson(Map<String, dynamic> json) => Drug(
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
