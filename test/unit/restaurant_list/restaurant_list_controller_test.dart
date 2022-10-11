// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restr/src/features/restaurant/application/restaurant_mapper.dart';
import 'package:restr/src/features/restaurant/application/restaurant_service.dart';
import 'package:restr/src/features/restaurant/data/responses/restaurant_list_response.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_list.dart';
import 'package:restr/src/features/restaurant/presentation/list_restaurant/controllers/restaurant_list_controller.dart';
import 'package:restr/src/services/network/api_result.dart';

import 'restaurant_list_controller_test.mocks.dart';

@GenerateMocks([RestaurantService])
void main() {
  final restaurantService = MockRestaurantService();

  testWidgets('getRestaurantList should be success', (tester) async {
    final restaurantListController =
        RestaurantListController(restaurantService: restaurantService);
    var expectedResult = {
      "error": false,
      "message": "success",
      "count": 20,
      "restaurants": [
        {
          "id": "rqdv5juczeskfw1e867",
          "name": "Melting Pot",
          "description":
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
          "pictureId": "14",
          "city": "Medan",
          "rating": 4.2
        },
        {
          "id": "s1knt6za9kkfw1e867",
          "name": "Kafe Kita",
          "description":
              "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...",
          "pictureId": "25",
          "city": "Gorontalo",
          "rating": 4
        }
      ]
    };

    when(restaurantService.getRestaurantList()).thenAnswer(
      (_) async => RestaurantMapper.mapToRestaurantList(
        ApiResult.success(
          RestaurantListResponse.fromJson(expectedResult),
        ),
      ),
    );

    final response = (await restaurantService.getRestaurantList()).maybeWhen(
        success: (data) {
      return data;
    }, orElse: () {
      RestaurantList();
    });
    await restaurantListController.getRestaurantList();
    final actualResult = restaurantListController.state.value;

    expect(actualResult, isA<RestaurantList?>());
    expect(actualResult?.restaurants.length, response?.restaurants.length);
  });

  testWidgets('getRestaurantList should be failed', (tester) async {
    final restaurantListController =
        RestaurantListController(restaurantService: restaurantService);

    final actualResult = restaurantListController.state.value;

    expect(actualResult, RestaurantList());
  });
}
