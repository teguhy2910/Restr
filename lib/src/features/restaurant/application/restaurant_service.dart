// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/restaurant/data/repositories/restaurant_repository.dart';
import 'package:restr/src/features/restaurant/domain/restaurant.dart';

class RestaurantService {
  final Ref ref;

  RestaurantService({
    required this.ref,
  });

  Future<Restaurants> getRestaurants() async {
    final restaurants =
        await ref.read(restaurantRepositoryProvider).getRestaurants();
    return restaurants;
  }

  Future<Restaurant> getRestaurantById({required String id}) async {
    final restaurants = await getRestaurants();
    final restaurant =
        restaurants.restaurants.firstWhere((element) => element.id == id);
    return restaurant;
  }

  Future<Restaurants> searchRestaurants({required String name}) async {
    final restaurants = await getRestaurants();
    final filteredRestaurants = restaurants.restaurants
        .where((element) => element.name == name)
        .toList();
    final result = Restaurants(restaurants: filteredRestaurants);
    return result;
  }
}

final restaurantServiceProvider = Provider<RestaurantService>((ref) {
  return RestaurantService(
    ref: ref,
  );
});
