import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/restaurant/application/restaurant_extensions.dart';
import 'package:restr/src/features/restaurant/data/repositories/restaurant_repository.dart';
import 'package:restr/src/features/restaurant/domain/restaurants.dart';

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
    final restaurant = restaurants.filterById(id: id);
    return restaurant;
  }

  Future<Restaurants> searchRestaurants({required String name}) async {
    final restaurants = await getRestaurants();
    final filteredRestaurants = restaurants.filterByName(name: name);
    return filteredRestaurants;
  }
}

final restaurantServiceProvider = Provider<RestaurantService>((ref) {
  return RestaurantService(
    ref: ref,
  );
});
