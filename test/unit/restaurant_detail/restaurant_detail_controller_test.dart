// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restr/src/features/restaurant/application/restaurant_mapper.dart';
import 'package:restr/src/features/restaurant/application/restaurant_service.dart';
import 'package:restr/src/features/restaurant/data/responses/restaurant_detail_response.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_detail.dart';
import 'package:restr/src/features/restaurant/presentation/detail_restaurant/controllers/detail_restaurant_controller.dart';
import 'package:restr/src/services/network/api_result.dart';

import 'restaurant_detail_controller_test.mocks.dart';

@GenerateMocks([RestaurantService])
void main() {
  final restaurantService = MockRestaurantService();

  testWidgets('getRestaurantDetail should be success', (tester) async {
    final restaurantDetailController =
        DetailRestaurantController(restaurantService: restaurantService);
    var restaurantId = 'rqdv5juczeskfw1e867';
    var expectedResult = {
      "error": false,
      "message": "success",
      "restaurant": {
        "id": "rqdv5juczeskfw1e867",
        "name": "Melting Pot",
        "description":
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ...",
        "city": "Medan",
        "address": "Jln. Pandeglang no 19",
        "pictureId": "14",
        "categories": [
          {"name": "Italia"},
          {"name": "Modern"}
        ],
        "menus": {
          "foods": [
            {"name": "Paket rosemary"},
            {"name": "Toastie salmon"}
          ],
          "drinks": [
            {"name": "Es krim"},
            {"name": "Sirup"}
          ]
        },
        "rating": 4.2,
        "customerReviews": [
          {
            "name": "Ahmad",
            "review": "Tidak rekomendasi untuk pelajar!",
            "date": "13 November 2019"
          }
        ]
      }
    };

    when(restaurantService.getRestaurantDetail(id: restaurantId)).thenAnswer(
      (_) async => RestaurantMapper.mapToRestaurantDetail(
        ApiResult.success(
          RestaurantDetailResponse.fromJson(expectedResult),
        ),
      ),
    );

    final response =
        (await restaurantService.getRestaurantDetail(id: restaurantId))
            .maybeWhen(success: (data) {
      return data;
    }, orElse: () {
      RestaurantDetail();
    });
    await restaurantDetailController.getRestaurantById(id: restaurantId);
    final actualResult = restaurantDetailController.state.value;

    expect(actualResult, isA<RestaurantDetail?>());
    expect(actualResult?.id, response?.id);
    expect(actualResult?.name, response?.name);
    expect(actualResult?.description, response?.description);
    expect(actualResult?.city, response?.city);
    expect(actualResult?.address, response?.address);
    expect(actualResult?.pictureId, response?.pictureId);
    expect(actualResult?.rating, response?.rating);
    expect(actualResult?.categories, isA<List<Category>>());
    expect(actualResult?.categories.length, response?.categories.length);
    expect(actualResult?.menus, isA<Menu>());
    expect(actualResult?.menus.foods, isA<List<Food>>());
    expect(actualResult?.menus.foods.length, response?.menus.foods.length);
    expect(actualResult?.menus.drinks, isA<List<Drink>>());
    expect(actualResult?.menus.drinks.length, response?.menus.drinks.length);
    expect(actualResult?.customerReviews, isA<List<CustomerReview>>());
    expect(
        actualResult?.customerReviews.length, response?.customerReviews.length);
  });

  testWidgets('getRestaurantDetail should be failed', (tester) async {
    final restaurantDetailController =
        DetailRestaurantController(restaurantService: restaurantService);
    final actualResult = restaurantDetailController.state.value;

    expect(actualResult, null);
  });
}
