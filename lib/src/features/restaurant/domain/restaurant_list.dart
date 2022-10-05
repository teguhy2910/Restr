import 'package:restr/src/features/restaurant/domain/restaurant.dart';

class RestaurantList {
  int count;
  List<Restaurant> restaurants;

  RestaurantList({
    int? count,
    List<Restaurant>? restaurants,
  })  : count = count ?? 0,
        restaurants = restaurants ?? [];
}
