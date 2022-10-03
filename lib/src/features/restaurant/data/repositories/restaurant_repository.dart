import 'package:flutter/services.dart';
import 'package:restr/src/constants/resources.dart';
import 'package:restr/src/features/restaurant/domain/restaurants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantRepository {
  Future<Restaurants> getRestaurants() async {
    final json = await rootBundle.loadString(Resources.restaurantsJson);
    await Future.delayed(const Duration(milliseconds: 500));
    return Restaurants.fromJson(json);
  }
}

final restaurantRepositoryProvider = Provider<RestaurantRepository>((ref) {
  return RestaurantRepository();
});
