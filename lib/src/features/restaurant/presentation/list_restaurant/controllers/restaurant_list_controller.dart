import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/restaurant/application/restaurant_service.dart';
import 'package:restr/src/features/restaurant/domain/restaurants.dart';

class RestaurantListController extends StateNotifier<AsyncValue<Restaurants>> {
  RestaurantListController({required this.restaurantService})
      : super(AsyncData<Restaurants>(Restaurants()));

  final RestaurantService restaurantService;

  Future<void> getRestaurants() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(restaurantService.getRestaurants);
  }
}

final restaurantListControllerProvider = StateNotifierProvider.autoDispose<
        RestaurantListController, AsyncValue<Restaurants>>(
    (ref) => RestaurantListController(
        restaurantService: ref.watch(restaurantServiceProvider)));
