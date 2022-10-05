class RestaurantDetail {
  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  List<Category> categories;
  Menu menus;
  double rating;
  List<CustomerReview> customerReviews;

  RestaurantDetail({
    String? id,
    String? name,
    String? description,
    String? city,
    String? address,
    String? pictureId,
    List<Category>? categories,
    Menu? menus,
    double? rating,
    List<CustomerReview>? customerReviews,
  })  : id = id ?? '',
        name = name ?? '',
        description = description ?? '',
        city = city ?? '',
        address = address ?? '',
        pictureId = pictureId ?? '',
        categories = categories ?? [],
        menus = menus ?? Menu(),
        rating = rating ?? 0.0,
        customerReviews = customerReviews ?? [];
}

class Category {
  String name;

  Category({
    String? name,
  }) : name = name ?? '';
}

class Menu {
  List<Food> foods;
  List<Drink> drinks;

  Menu({
    List<Food>? foods,
    List<Drink>? drinks,
  })  : foods = foods ?? [],
        drinks = drinks ?? [];
}

class Food {
  String name;

  Food({
    String? name,
  }) : name = name ?? '';
}

class Drink {
  String name;

  Drink({
    String? name,
  }) : name = name ?? '';
}

class CustomerReview {
  String name;
  String review;
  String date;

  CustomerReview({
    String? name,
    String? review,
    String? date,
  })  : name = name ?? '',
        review = review ?? '',
        date = date ?? '';
}
