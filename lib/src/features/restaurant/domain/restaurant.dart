// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Restaurant {
  String id;
  String name;
  String description;
  String city;
  String pictureId;
  double rating;

  Restaurant({
    String? id,
    String? name,
    String? description,
    String? city,
    String? pictureId,
    double? rating,
  })  : id = id ?? '',
        name = name ?? '',
        description = description ?? '',
        city = city ?? '',
        pictureId = pictureId ?? '',
        rating = rating ?? 0.0;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'city': city,
      'pictureId': pictureId,
      'rating': rating,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      city: map['city'] as String,
      pictureId: map['pictureId'] as String,
      rating: map['rating'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) =>
      Restaurant.fromMap(json.decode(source) as Map<String, dynamic>);
}
