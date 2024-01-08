// To parse this JSON data, do
//
//     final resturant = resturantFromJson(jsonString);

import 'dart:convert';

Resturant resturantFromJson(String str) => Resturant.fromJson(json.decode(str));

String resturantToJson(Location data) => json.encode(data.toJson());

class Resturant {
  String status;
  String code;
  List<Datum> data;

  Resturant({
    required this.status,
    required this.code,
    required this.data,
  });

  factory Resturant.fromJson(Map<String, dynamic> json) => Resturant(
        status: json["status"],
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lat": 25.22,
        "lng": 45.32,
      };
}

class Datum {
  int id;
  String name;
  String tags;
  double rating;
  int discount;
  String primaryImage;
  double distance;

  Datum({
    required this.id,
    required this.name,
    required this.tags,
    required this.rating,
    required this.discount,
    required this.primaryImage,
    required this.distance,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        tags: json["tags"],
        rating: json["rating"]?.toDouble(),
        discount: json["discount"],
        primaryImage: json["primary_image"],
        distance: json["distance"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": 25.22,
        "lng": 45.32,
      };
}

class Location {
  double lat;
  double lng;
  Location({required this.lat, required this.lng});
  Map<String, dynamic> toJson() => {
        "lat": 25.22,
        "lng": 45.32,
      };
}
