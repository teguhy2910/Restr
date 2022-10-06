import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restr/src/common_widgets/common_widgets.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_search.dart';
import 'package:restr/src/features/restaurant/presentation/search_restaurant/controllers/result_search_text.dart';
import 'package:restr/src/features/restaurant/presentation/search_restaurant/controllers/search_restaurant_controller.dart';
import 'package:restr/src/routing/app_routes.dart';
import 'package:restr/src/routing/extras.dart';

class SearchRestaurantList extends ConsumerWidget {
  const SearchRestaurantList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<RestaurantSearch?> restaurants =
        ref.watch(searchRestaurantControllerProvider);
    final String result = ref.watch(resultSearchTextControllerProvider);
    if (result.isEmpty) {
      return const LottieWidget(
        assets: Resources.lottieSearch,
        description: 'Search restaurant here...',
      );
    }
    return AsyncValueWidget<RestaurantSearch?>(
      value: restaurants,
      data: (value) {
        if (value == null) {
          return const LottieWidget(
            assets: Resources.lottieSearch,
            description: 'Search restaurant here...',
          );
        }
        if (value.restaurants.isEmpty) {
          return LottieWidget(
            assets: Resources.lottieEmpty,
            description: '"$result" not found!',
          );
        }
        return ListView.builder(
          itemCount: value.restaurants.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final restaurant = value.restaurants[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: Sizes.p20),
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(
                    Routes.detailRestaurant.name,
                    extra: Extras(
                      extras: {
                        Keys.restaurantId: restaurant.id,
                      },
                    ),
                  );
                },
                child: RestaurantListTile(
                  restaurant: restaurant,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
