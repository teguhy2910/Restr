import 'package:restr/src/features/restaurant/domain/restaurants.dart';

extension XRestaurants on Restaurants {
  Restaurant filterById({required String id}) {
    return restaurants.firstWhere((element) => element.id == id);
  }

  Restaurants filterByName({required String name}) {
    final result =
        restaurants.where((element) => element.name == name).toList();
    return Restaurants(restaurants: result);
  }
}