// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.img,
    this.pharmName,
    this.adress,
    this.status,
  });

  int id;
  String name;
  String email;
  String phone;
  dynamic img;
  dynamic pharmName;
  dynamic adress;
  String status;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    img: json["img"],
    pharmName: json["pharm_name"],
    adress: json["adress"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "img": img,
    "pharm_name": pharmName,
    "adress": adress,
    "status": status,
  };
}
