import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/exceptions/network_exceptions.dart';
import 'package:restr/src/features/restaurant/data/responses/restaurant_detail_response.dart';
import 'package:restr/src/features/restaurant/data/responses/restaurant_list_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/restaurant/data/responses/restaurant_search_response.dart';
import 'package:restr/src/features/restaurant/domain/restaurant.dart';
import 'package:restr/src/services/network/api_result.dart';
import 'package:restr/src/services/network/dio_client.dart';
import 'package:restr/src/services/network/endpoints.dart';

class RestaurantRepository {
  final DioClient _dioClient;

  RestaurantRepository(this._dioClient);

  Future<ApiResult<RestaurantListResponse>> getRestaurantList() async {
    try {
      final response = await _dioClient.get(Endpoints.restaurantList);
      return ApiResult.success(RestaurantListResponse.fromJson(response));
    } catch (e, stacktrace) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(e),
        stacktrace,
      );
    }
  }

  Future<ApiResult<RestaurantDetailResponse>> getRestaurantDetail(
      {required String id}) async {
    try {
      final response = await _dioClient
          .get(Endpoints.restaurantDetail.replaceAll('{id}', id));
      return ApiResult.success(RestaurantDetailResponse.fromJson(response));
    } catch (e, stacktrace) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(e),
        stacktrace,
      );
    }
  }

  Future<ApiResult<RestaurantSearchResponse>> getRestaurantSearch(
      {required String query}) async {
    try {
      final response = await _dioClient.get(
        Endpoints.restaurantSearch,
        queryParameters: {
          'q': query,
        },
      );
      return ApiResult.success(RestaurantSearchResponse.fromJson(response));
    } catch (e, stacktrace) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(e),
        stacktrace,
      );
    }
  }

  void saveFavoriteRestaurant({required Restaurant restaurant}) async {
    final hiveRestaurant = Hive.box<String>(Keys.hiveRestaurantBox);
    final restaurantJson = restaurant.toJson();
    await hiveRestaurant.put(restaurant.id, restaurantJson);
    debugPrint('save Favorite Restaurant: ${restaurant.id}');
  }

  List<Restaurant> getAllFavoriteRestaurant() {
    final hiveRestaurant = Hive.box<String>(Keys.hiveRestaurantBox);
    return hiveRestaurant.values
        .toList()
        .map((item) => Restaurant.fromJson(item))
        .toList();
  }

  void deleteFavoriteRestaurant({required String restaurantId}) async {
    final hiveRestaurant = Hive.box<String>(Keys.hiveRestaurantBox);
    await hiveRestaurant.delete(restaurantId);
    debugPrint('delete Favorite Restaurant: $restaurantId');
  }

  bool isFavoriteRestaurantExist({required String restaurantId}) {
    final hiveRestaurant = Hive.box<String>(Keys.hiveRestaurantBox);
    debugPrint('isFavorite: ${hiveRestaurant.containsKey(restaurantId)}');
    return hiveRestaurant.containsKey(restaurantId);
  }
}

final restaurantRepositoryProvider = Provider<RestaurantRepository>((ref) {
  return RestaurantRepository(ref.read(dioClientProvider));
});
