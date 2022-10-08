import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/restaurant/application/restaurant_service.dart';
import 'package:restr/src/features/restaurant/domain/restaurant.dart';
import 'package:restr/src/features/restaurant/presentation/favorite_restaurant/extensions/search_favorites_extensions.dart';

class SearchFavoriteController extends StateNotifier<List<Restaurant>> {
  SearchFavoriteController({required this.restaurantService}) : super([]);

  final RestaurantService restaurantService;

  Future<void> searchFavoriteRestaurant({required String query}) async {
    state =
        restaurantService.getAllFavoriteRestaurant().filterByName(name: query);
  }
}

final searchFavoriteControllerProvider = StateNotifierProvider.autoDispose<
        SearchFavoriteController, List<Restaurant>>(
    (ref) => SearchFavoriteController(
        restaurantService: ref.watch(restaurantServiceProvider)));
