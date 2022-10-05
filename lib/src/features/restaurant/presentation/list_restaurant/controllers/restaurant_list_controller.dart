import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/restaurant/application/restaurant_service.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_list.dart';

class RestaurantListController
    extends StateNotifier<AsyncValue<RestaurantList>> {
  RestaurantListController({required this.restaurantService})
      : super(AsyncData<RestaurantList>(RestaurantList()));

  final RestaurantService restaurantService;

  Future<void> getRestaurantList() async {
    state = const AsyncValue.loading();
    final result = await restaurantService.getRestaurantList();
    result.when(
      success: (data) => state = AsyncValue.data(data),
      failure: (error, stacktrace) => state = AsyncError(error, stacktrace),
    );
  }
}

final restaurantListControllerProvider = StateNotifierProvider.autoDispose<
        RestaurantListController, AsyncValue<RestaurantList>>(
    (ref) => RestaurantListController(
        restaurantService: ref.watch(restaurantServiceProvider)));
