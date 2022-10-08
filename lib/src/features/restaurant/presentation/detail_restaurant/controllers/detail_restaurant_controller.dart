import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/restaurant/application/restaurant_service.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_detail.dart';

class DetailRestaurantController
    extends StateNotifier<AsyncValue<RestaurantDetail>> {
  DetailRestaurantController({required this.restaurantService})
      : super(const AsyncLoading());

  final RestaurantService restaurantService;

  Future<void> getRestaurantById({required String id}) async {
    state = const AsyncLoading();
    final result = await restaurantService.getRestaurantDetail(id: id);
    result.when(
      success: (data) => state = AsyncData(data),
      failure: (error, stacktrace) => state = AsyncError(error, stacktrace),
    );
  }
}

final detailRestaurantControllerProvider = StateNotifierProvider.autoDispose<
        DetailRestaurantController, AsyncValue<RestaurantDetail>>(
    (ref) => DetailRestaurantController(
        restaurantService: ref.watch(restaurantServiceProvider)));
