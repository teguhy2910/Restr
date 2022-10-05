// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ReviewPost {
  final String id;
  final String name;
  final String review;

  ReviewPost({
    String? id,
    String? name,
    String? review,
  })  : id = id ?? '',
        name = name ?? '',
        review = review ?? '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'review': review,
    };
  }

  factory ReviewPost.fromMap(Map<String, dynamic> map) {
    return ReviewPost(
      id: map['id'] as String,
      name: map['name'] as String,
      review: map['review'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewPost.fromJson(String source) =>
      ReviewPost.fromMap(json.decode(source) as Map<String, dynamic>);
}
