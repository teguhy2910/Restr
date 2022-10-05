class RestaurantDetailResponse {
  bool? error;
  String? message;
  RestaurantDetailItemResponse? restaurant;

  RestaurantDetailResponse({this.error, this.message, this.restaurant});

  RestaurantDetailResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    restaurant = json['restaurant'] != null
        ? RestaurantDetailItemResponse.fromJson(json['restaurant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    if (restaurant != null) {
      data['restaurant'] = restaurant!.toJson();
    }
    return data;
  }
}

class RestaurantDetailItemResponse {
  String? id;
  String? name;
  String? description;
  String? city;
  String? address;
  String? pictureId;
  List<CategoryResponse>? categories;
  MenuResponse? menus;
  double? rating;
  List<CustomerReviewResponse>? customerReviews;

  RestaurantDetailItemResponse(
      {this.id,
      this.name,
      this.description,
      this.city,
      this.address,
      this.pictureId,
      this.categories,
      this.menus,
      this.rating,
      this.customerReviews});

  RestaurantDetailItemResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    city = json['city'];
    address = json['address'];
    pictureId = json['pictureId'];
    if (json['categories'] != null) {
      categories = <CategoryResponse>[];
      json['categories'].forEach((v) {
        categories!.add(CategoryResponse.fromJson(v));
      });
    }
    menus = json['menus'] != null ? MenuResponse.fromJson(json['menus']) : null;
    rating = (json['rating'] as num?)?.toDouble();
    if (json['customerReviews'] != null) {
      customerReviews = <CustomerReviewResponse>[];
      json['customerReviews'].forEach((v) {
        customerReviews!.add(CustomerReviewResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['city'] = city;
    data['address'] = address;
    data['pictureId'] = pictureId;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (menus != null) {
      data['menus'] = menus!.toJson();
    }
    data['rating'] = rating;
    if (customerReviews != null) {
      data['customerReviews'] =
          customerReviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryResponse {
  String? name;

  CategoryResponse({this.name});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class MenuResponse {
  List<FoodResponse>? foods;
  List<DrinkResponse>? drinks;

  MenuResponse({this.foods, this.drinks});

  MenuResponse.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      foods = <FoodResponse>[];
      json['foods'].forEach((v) {
        foods!.add(FoodResponse.fromJson(v));
      });
    }
    if (json['drinks'] != null) {
      drinks = <DrinkResponse>[];
      json['drinks'].forEach((v) {
        drinks!.add(DrinkResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (foods != null) {
      data['foods'] = foods!.map((v) => v.toJson()).toList();
    }
    if (drinks != null) {
      data['drinks'] = drinks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FoodResponse {
  String? name;

  FoodResponse({this.name});

  FoodResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class DrinkResponse {
  String? name;

  DrinkResponse({this.name});

  DrinkResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class CustomerReviewResponse {
  String? name;
  String? review;
  String? date;

  CustomerReviewResponse({this.name, this.review, this.date});

  CustomerReviewResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    review = json['review'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['review'] = review;
    data['date'] = date;
    return data;
  }
}
