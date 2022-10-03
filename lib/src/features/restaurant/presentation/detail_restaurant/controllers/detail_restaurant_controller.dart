import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/restaurant/application/restaurant_service.dart';
import 'package:restr/src/features/restaurant/domain/restaurants.dart';

class DetailRestaurantController extends StateNotifier<AsyncValue<Restaurant>> {
  DetailRestaurantController({required this.restaurantService})
      : super(const AsyncLoading());

  final RestaurantService restaurantService;

  Future<void> getRestaurantById({required String id}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => restaurantService.getRestaurantById(id: id),
    );
  }
}

final detailRestaurantControllerProvider = StateNotifierProvider.autoDispose<
        DetailRestaurantController, AsyncValue<Restaurants>>(
    (ref) => DetailRestaurantController(
        restaurantService: ref.watch(restaurantServiceProvider)));
