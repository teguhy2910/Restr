import 'package:restr/src/features/restaurant/domain/restaurant.dart';

class RestaurantSearch {
  int founded;
  List<Restaurant> restaurants;

  RestaurantSearch({
    int? founded,
    List<Restaurant>? restaurants,
  })  : founded = founded ?? 0,
        restaurants = restaurants ?? [];
}
