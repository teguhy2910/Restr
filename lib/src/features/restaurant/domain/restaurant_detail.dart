import 'package:equatable/equatable.dart';

class RestaurantDetail extends Equatable {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Category> categories;
  final Menu menus;
  final double rating;
  final List<CustomerReview> customerReviews;

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

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        city,
        address,
        pictureId,
        categories,
        menus,
        rating,
        customerReviews,
      ];
}

class Category extends Equatable {
  final String name;

  const Category({
    String? name,
  }) : name = name ?? '';

  @override
  List<Object?> get props => [
        name,
      ];
}

class Menu extends Equatable {
  final List<Food> foods;
  final List<Drink> drinks;

  Menu({
    List<Food>? foods,
    List<Drink>? drinks,
  })  : foods = foods ?? [],
        drinks = drinks ?? [];

  @override
  List<Object?> get props => [
        foods,
        drinks,
      ];
}

class Food extends Equatable {
  final String name;

  const Food({
    String? name,
  }) : name = name ?? '';

  @override
  List<Object?> get props => [
        name,
      ];
}

class Drink extends Equatable {
  final String name;

  const Drink({
    String? name,
  }) : name = name ?? '';

  @override
  List<Object?> get props => [
        name,
      ];
}

class CustomerReview extends Equatable {
  final String name;
  final String review;
  final String date;

  const CustomerReview({
    String? name,
    String? review,
    String? date,
  })  : name = name ?? '',
        review = review ?? '',
        date = date ?? '';

  @override
  List<Object?> get props => [
        name,
        review,
        date,
      ];
}
