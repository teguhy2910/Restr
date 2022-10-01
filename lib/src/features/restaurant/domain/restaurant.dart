class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;
}

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  final List<Food> foods;
  final List<Drink> drinks;
}

class Food {
  Food({
    required this.name,
  });

  final String name;
}

class Drink {
  Drink({
    required this.name,
  });

  final String name;
}
