// To parse this JSON data, do
//
//     final drug = drugFromJson(jsonString);

import 'dart:convert';

List<Drug> drugFromJson(String str) => List<Drug>.from(json.decode(str).map((x) => Drug.fromJson(x)));

String drugToJson(List<Drug> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Drug {
  Drug({
    this.id,
    this.name,
    this.form,
    this.status,
  });

  int id;
  String name;
  String form;
  String status;

  factory Drug.fromJson(Map<String, dynamic> json) => Drug(
    id: json["id"],
    name: json["name"],
    form: json["form"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "form": form,
    "status": status,
  };
}