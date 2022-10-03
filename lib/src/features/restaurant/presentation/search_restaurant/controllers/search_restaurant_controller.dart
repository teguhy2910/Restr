import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/restaurant/application/restaurant_service.dart';
import 'package:restr/src/features/restaurant/domain/restaurants.dart';

class SearchRestaurantController
    extends StateNotifier<AsyncValue<Restaurants?>> {
  SearchRestaurantController({required this.restaurantService})
      : super(const AsyncData(null));

  final RestaurantService restaurantService;

  Future<void> searchRestaurant({required String name}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => restaurantService.searchRestaurants(name: name),
    );
  }
}

final searchRestaurantControllerProvider = StateNotifierProvider.autoDispose<
        SearchRestaurantController, AsyncValue<Restaurants?>>(
    (ref) => SearchRestaurantController(
        restaurantService: ref.watch(restaurantServiceProvider)));
