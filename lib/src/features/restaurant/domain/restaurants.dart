import 'dart:convert';

class Restaurants {
  List<Restaurant> restaurants;
  Restaurants({
    List<Restaurant>? restaurants,
  }) : restaurants = restaurants ?? [];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'restaurants': restaurants.map((x) => x.toMap()).toList(),
    };
  }

  factory Restaurants.fromMap(Map<String, dynamic> map) {
    return Restaurants(
      restaurants: List<Restaurant>.from(
        (map['restaurants'] as List<dynamic>).map<Restaurant>(
          (x) => Restaurant.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurants.fromJson(String source) =>
      Restaurants.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Restaurants(restaurants: $restaurants)';
}

class Restaurant {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menus menus;

  Restaurant({
    this.id = '',
    this.name = '',
    this.description = '',
    this.pictureId = '',
    this.city = '',
    this.rating = 0.0,
    Menus? menus,
  }) : menus = menus ?? Menus();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'pictureId': pictureId,
      'city': city,
      'rating': rating,
      'menus': menus.toMap(),
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      pictureId: map['pictureId'] as String,
      city: map['city'] as String,
      rating: (map['rating'] as num).toDouble(),
      menus: Menus.fromMap(map['menus'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) =>
      Restaurant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Restaurant(id: $id, name: $name, description: $description, pictureId: $pictureId, city: $city, rating: $rating, menus: $menus)';
  }
}

class Menus {
  List<Food> foods;
  List<Drink> drinks;
  Menus({
    List<Food>? foods,
    List<Drink>? drinks,
  })  : foods = foods ?? [],
        drinks = drinks ?? [];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foods': foods.map((x) => x.toMap()).toList(),
      'drinks': drinks.map((x) => x.toMap()).toList(),
    };
  }

  factory Menus.fromMap(Map<String, dynamic> map) {
    return Menus(
      foods: List<Food>.from(
        (map['foods'] as List<dynamic>).map<Food>(
          (x) => Food.fromMap(x as Map<String, dynamic>),
        ),
      ),
      drinks: List<Drink>.from(
        (map['drinks'] as List<dynamic>).map<Drink>(
          (x) => Drink.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Menus.fromJson(String source) =>
      Menus.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Menus(foods: $foods, drinks: $drinks)';
}

class Food {
  String name;
  Food({
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Food(name: $name)';
}

class Drink {
  String name;
  Drink({
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Drink.fromMap(Map<String, dynamic> map) {
    return Drink(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Drink.fromJson(String source) =>
      Drink.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Drink(name: $name)';
}
