import 'dart:convert';

import 'package:restr/src/constants/resources.dart';
import 'package:restr/src/features/restaurant/domain/restaurant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantRepository {
  Future<Restaurants> getRestaurants() async {
    final json = await jsonDecode(Resources.restaurantsJson);
    return Restaurants.fromJson(json);
  }
}

final restaurantRepositoryProvider = Provider<RestaurantRepository>((ref) {
  return RestaurantRepository();
});
