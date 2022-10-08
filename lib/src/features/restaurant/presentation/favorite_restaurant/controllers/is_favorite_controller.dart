import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/restaurant/application/restaurant_service.dart';

class IsFavoriteController extends StateNotifier<bool> {
  IsFavoriteController({required this.restaurantService}) : super(false);

  final RestaurantService restaurantService;

  void isFavoriteRestaurantExist({required String restaurantId}) {
    state =
        restaurantService.isFavoriteRestaurantExist(restaurantId: restaurantId);
  }
}

final isFavoriteControllerProvider =
    StateNotifierProvider.autoDispose<IsFavoriteController, bool>(
  (ref) => IsFavoriteController(
    restaurantService: ref.watch(restaurantServiceProvider),
  ),
);
