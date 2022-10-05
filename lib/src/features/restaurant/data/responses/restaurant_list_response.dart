class RestaurantListResponse {
  bool? error;
  String? message;
  int? count;
  List<RestaurantListItemResponse>? restaurants;

  RestaurantListResponse(
      {this.error, this.message, this.count, this.restaurants});

  RestaurantListResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    count = json['count'];
    if (json['restaurants'] != null) {
      restaurants = <RestaurantListItemResponse>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(RestaurantListItemResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    data['count'] = count;
    if (restaurants != null) {
      data['restaurants'] = restaurants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RestaurantListItemResponse {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;

  RestaurantListItemResponse(
      {this.id,
      this.name,
      this.description,
      this.pictureId,
      this.city,
      this.rating});

  RestaurantListItemResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pictureId = json['pictureId'];
    city = json['city'];
    rating = (json['rating'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['pictureId'] = pictureId;
    data['city'] = city;
    data['rating'] = rating;
    return data;
  }
}
