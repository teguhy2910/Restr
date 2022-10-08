import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/restaurant/application/restaurant_service.dart';
import 'package:restr/src/features/restaurant/domain/restaurant.dart';

class FavoritesController extends StateNotifier<List<Restaurant>> {
  FavoritesController({required this.restaurantService}) : super([]);

  final RestaurantService restaurantService;

  Future<void> getAllFavoriteRestaurant() async {
    state = restaurantService.getAllFavoriteRestaurant();
  }

  void favoriteOnClick({required Restaurant restaurant}) {
    if (restaurantService.isFavoriteRestaurantExist(
        restaurantId: restaurant.id)) {
      restaurantService.deleteFavoriteRestaurant(restaurantId: restaurant.id);
    } else {
      restaurantService.saveFavoriteRestaurant(restaurant: restaurant);
    }
  }

  bool isFavoriteRestaurantExist({required String restaurantId}) {
    return restaurantService.isFavoriteRestaurantExist(
        restaurantId: restaurantId);
  }
}

final favoritesControllerProvider =
    StateNotifierProvider.autoDispose<FavoritesController, List<Restaurant>>(
  (ref) => FavoritesController(
    restaurantService: ref.watch(restaurantServiceProvider),
  ),
);
