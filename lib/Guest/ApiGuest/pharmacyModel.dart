// To parse this JSON data, do
//
//     final pharmacy = pharmacyFromJson(jsonString);

import 'dart:convert';

List<Pharmacy> pharmacyFromJson(String str) => List<Pharmacy>.from(json.decode(str).map((x) => Pharmacy.fromJson(x)));

String pharmacyToJson(List<Pharmacy> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pharmacy {
  Pharmacy({
    this.id,
    this.userId,
    this.pharmName,
    this.adress,
    this.latitude,
    this.longtude,
    this.createdAt,
    this.updatedAt,
    this.distance,
    this.userName,
    this.userPhone,
  });

  int id;
  int userId;
  String pharmName;
  String adress;
  double latitude;
  double longtude;
  DateTime createdAt;
  DateTime updatedAt;
  double distance;
  String userName;
  String userPhone;

  factory Pharmacy.fromJson(Map<String, dynamic> json) => Pharmacy(
    id: json["id"],
    userId: json["user_id"],
    pharmName: json["pharm_name"],
    adress: json["adress"],
    latitude: json["latitude"].toDouble(),
    longtude: json["longtude"].toDouble(),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    distance: json["distance"].toDouble(),
    userName: json["user_name"],
    userPhone: json["user_phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "pharm_name": pharmName,
    "adress": adress,
    "latitude": latitude,
    "longtude": longtude,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "distance": distance,
    "user_name": userName,
    "user_phone": userPhone,
  };
}
