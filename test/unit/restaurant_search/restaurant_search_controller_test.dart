// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restr/src/features/restaurant/application/restaurant_mapper.dart';
import 'package:restr/src/features/restaurant/application/restaurant_service.dart';
import 'package:restr/src/features/restaurant/data/responses/restaurant_search_response.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_search.dart';
import 'package:restr/src/features/restaurant/presentation/search_restaurant/controllers/search_restaurant_controller.dart';
import 'package:restr/src/services/network/api_result.dart';

import 'restaurant_search_controller_test.mocks.dart';

@GenerateMocks([RestaurantService])
void main() {
  final restaurantService = MockRestaurantService();

  testWidgets('searchRestaurant should be success', (tester) async {
    final restaurantSearchController =
        SearchRestaurantController(restaurantService: restaurantService);
    var query = 'Makan mudah';
    var expectedResult = {
      "error": false,
      "founded": 1,
      "restaurants": [
        {
          "id": "fnfn8mytkpmkfw1e867",
          "name": "Makan mudah",
          "description":
              "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, ...",
          "pictureId": "22",
          "city": "Medan",
          "rating": 3.7
        }
      ]
    };

    when(restaurantService.getRestaurantSearch(query: query)).thenAnswer(
      (_) async => RestaurantMapper.mapToRestaurantSearch(
        ApiResult.success(
          RestaurantSearchResponse.fromJson(expectedResult),
        ),
      ),
    );

    final response = (await restaurantService.getRestaurantSearch(query: query))
        .maybeWhen(success: (data) {
      return data;
    }, orElse: () {
      RestaurantSearch();
    });
    await restaurantSearchController.searchRestaurant(query: query);
    final actualResult = restaurantSearchController.state.value;

    expect(actualResult, isA<RestaurantSearch?>());
    expect(actualResult?.restaurants.length, response?.restaurants.length);
  });

  testWidgets('searchRestaurant should be failed', (tester) async {
    final restaurantSearchController =
        SearchRestaurantController(restaurantService: restaurantService);

    final actualResult = restaurantSearchController.state.value;

    expect(actualResult, null);
  });
}
