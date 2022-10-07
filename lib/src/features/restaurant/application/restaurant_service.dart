import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/restaurant/application/restaurant_mapper.dart';
import 'package:restr/src/features/restaurant/data/repositories/restaurant_repository.dart';
import 'package:restr/src/features/restaurant/domain/restaurant.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_detail.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_list.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_search.dart';
import 'package:restr/src/services/network/api_result.dart';

class RestaurantService {
  final Ref ref;

  RestaurantService({
    required this.ref,
  });

  Future<ApiResult<RestaurantList>> getRestaurantList() async {
    final restaurantList =
        await ref.read(restaurantRepositoryProvider).getRestaurantList();
    return RestaurantMapper.mapToRestaurantList(restaurantList);
  }

  Future<ApiResult<RestaurantDetail>> getRestaurantDetail(
      {required String id}) async {
    final restaurantDetail = await ref
        .read(restaurantRepositoryProvider)
        .getRestaurantDetail(id: id);
    return RestaurantMapper.mapToRestaurantDetail(restaurantDetail);
  }

  Future<ApiResult<RestaurantSearch>> getRestaurantSearch(
      {required String query}) async {
    final restaurantSearch = await ref
        .read(restaurantRepositoryProvider)
        .getRestaurantSearch(query: query);
    return RestaurantMapper.mapToRestaurantSearch(restaurantSearch);
  }

  void saveFavoriteRestaurant({required Restaurant restaurant}) async {
    ref
        .read(restaurantRepositoryProvider)
        .saveFavoriteRestaurant(restaurant: restaurant);
  }

  List<Restaurant> getAllFavoriteRestaurant() {
    return ref.read(restaurantRepositoryProvider).getAllFavoriteRestaurant();
  }

  void deleteFavoriteRestaurant({required String restaurantId}) async {
    ref
        .read(restaurantRepositoryProvider)
        .deleteFavoriteRestaurant(restaurantId: restaurantId);
  }

  bool isFavoriteRestaurantExist({required String restaurantId}) {
    return ref
        .read(restaurantRepositoryProvider)
        .isFavoriteRestaurantExist(restaurantId: restaurantId);
  }
}

final restaurantServiceProvider = Provider<RestaurantService>((ref) {
  return RestaurantService(
    ref: ref,
  );
});
