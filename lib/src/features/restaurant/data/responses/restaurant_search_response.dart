class RestaurantSearchResponse {
  bool? error;
  String? message;
  int? founded;
  List<RestaurantSearchItemResponse>? restaurants;

  RestaurantSearchResponse({
    this.error,
    this.message,
    this.founded,
    this.restaurants,
  });

  RestaurantSearchResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    founded = json['founded'];
    if (json['restaurants'] != null) {
      restaurants = <RestaurantSearchItemResponse>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(RestaurantSearchItemResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    data['founded'] = founded;
    if (restaurants != null) {
      data['restaurants'] = restaurants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RestaurantSearchItemResponse {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;

  RestaurantSearchItemResponse(
      {this.id,
      this.name,
      this.description,
      this.pictureId,
      this.city,
      this.rating});

  RestaurantSearchItemResponse.fromJson(Map<String, dynamic> json) {
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
