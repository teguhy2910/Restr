import 'package:restr/src/features/restaurant/domain/restaurants.dart';

extension XRestaurants on Restaurants {
  Restaurant filterById({required String id}) {
    return restaurants.firstWhere((element) => element.id.contains(id));
  }

  Restaurants filterByName({required String name}) {
    final result = restaurants.where((element) {
      return element.name.toLowerCase().contains(name.toLowerCase());
    }).toList();
    return Restaurants(restaurants: result);
  }
}
