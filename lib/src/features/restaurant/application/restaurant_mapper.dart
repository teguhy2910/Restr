import 'package:restr/src/features/restaurant/data/responses/restaurant_detail_response.dart';
import 'package:restr/src/features/restaurant/data/responses/restaurant_list_response.dart';
import 'package:restr/src/features/restaurant/data/responses/restaurant_search_response.dart';
import 'package:restr/src/features/restaurant/domain/restaurant.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_detail.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_list.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_search.dart';
import 'package:restr/src/services/network/api_result.dart';
import 'package:restr/src/shared/extensions/extensions.dart';

class RestaurantMapper {
  static ApiResult<RestaurantList> mapToRestaurantList(
      ApiResult<RestaurantListResponse> response) {
    return response.when(
      success: (data) {
        return ApiResult.success(RestaurantList(
          count: data.count,
          restaurants: data.restaurants
              ?.map((item) => Restaurant(
                    id: item.id,
                    city: item.city,
                    description: item.description,
                    name: item.name,
                    pictureId: item.pictureId?.getSmallPicture,
                    rating: item.rating,
                  ))
              .toList(),
        ));
      },
      failure: (error, stacktrace) {
        return ApiResult.failure(error, stacktrace);
      },
    );
  }

  static ApiResult<RestaurantDetail> mapToRestaurantDetail(
      ApiResult<RestaurantDetailResponse> response) {
    return response.when(
      success: (data) {
        final restaurant = data.restaurant;
        return ApiResult.success(
          RestaurantDetail(
            id: restaurant?.id,
            city: restaurant?.city,
            description: restaurant?.description,
            name: restaurant?.name,
            pictureId: restaurant?.pictureId?.getLargePicture,
            rating: restaurant?.rating,
            address: restaurant?.address,
            categories: restaurant?.categories
                ?.map((category) => Category(name: category.name))
                .toList(),
            customerReviews: restaurant?.customerReviews
                ?.map((customerReview) => CustomerReview(
                    name: customerReview.name,
                    review: customerReview.review,
                    date: customerReview.date))
                .toList(),
            menus: Menu(
              drinks: restaurant?.menus?.drinks
                  ?.map((drink) => Drink(name: drink.name))
                  .toList(),
              foods: restaurant?.menus?.foods
                  ?.map((drink) => Food(name: drink.name))
                  .toList(),
            ),
          ),
        );
      },
      failure: (error, stacktrace) {
        return ApiResult.failure(error, stacktrace);
      },
    );
  }

  static ApiResult<RestaurantSearch> mapToRestaurantSearch(
      ApiResult<RestaurantSearchResponse> response) {
    return response.when(
      success: (data) {
        return ApiResult.success(RestaurantSearch(
          founded: data.founded,
          restaurants: data.restaurants
              ?.map((item) => Restaurant(
                    id: item.id,
                    city: item.city,
                    description: item.description,
                    name: item.name,
                    pictureId: item.pictureId?.getSmallPicture,
                    rating: item.rating,
                  ))
              .toList(),
        ));
      },
      failure: (error, stacktrace) {
        return ApiResult.failure(error, stacktrace);
      },
    );
  }
}
