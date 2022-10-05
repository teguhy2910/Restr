import 'package:restr/src/exceptions/network_exceptions.dart';
import 'package:restr/src/features/restaurant/data/responses/restaurant_detail_response.dart';
import 'package:restr/src/features/restaurant/data/responses/restaurant_list_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/restaurant/data/responses/restaurant_search_response.dart';
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
}

final restaurantRepositoryProvider = Provider<RestaurantRepository>((ref) {
  return RestaurantRepository(ref.read(dioClientProvider));
});
