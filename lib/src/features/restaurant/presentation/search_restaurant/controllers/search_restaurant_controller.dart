import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/restaurant/application/restaurant_service.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_search.dart';

class SearchRestaurantController
    extends StateNotifier<AsyncValue<RestaurantSearch?>> {
  SearchRestaurantController({required this.restaurantService})
      : super(const AsyncData(null));

  final RestaurantService restaurantService;

  Future<void> searchRestaurant({required String query}) async {
    state = const AsyncLoading();
    final result = await restaurantService.getRestaurantSearch(query: query);
    result.when(
      success: (data) => state = AsyncData(data),
      failure: (error, stacktrace) => state = AsyncError(error, stacktrace),
    );
  }
}

final searchRestaurantControllerProvider = StateNotifierProvider.autoDispose<
        SearchRestaurantController, AsyncValue<RestaurantSearch?>>(
    (ref) => SearchRestaurantController(
        restaurantService: ref.watch(restaurantServiceProvider)));
