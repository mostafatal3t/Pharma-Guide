// To parse this JSON data, do
//
//     final empty = emptyFromJson(jsonString);

import 'dart:convert';

Response emptyFromJson(String str) => Response.fromJson(json.decode(str));

String emptyToJson(Response data) => json.encode(data.toJson());

class Response {
  Response({
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  int id;
  String name;
  String email;
  String phone;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
  };
}
