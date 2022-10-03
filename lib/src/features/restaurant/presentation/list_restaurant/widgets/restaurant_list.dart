import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restr/src/common_widgets/common_widgets.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/domain/restaurants.dart';
import 'package:restr/src/features/restaurant/presentation/list_restaurant/controllers/restaurant_list_controller.dart';
import 'package:restr/src/routing/app_routes.dart';
import 'package:restr/src/routing/extras.dart';
import 'package:restr/src/shared/widgets/restaurant_list_tile.dart';

class RestaurantList extends ConsumerStatefulWidget {
  const RestaurantList({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends ConsumerState<RestaurantList> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      ref.read(restaurantListControllerProvider.notifier).getRestaurants();
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<Restaurants> restaurants =
        ref.watch(restaurantListControllerProvider);

    return AsyncValueWidget<Restaurants>(
      value: restaurants,
      data: (value) => ListView.builder(
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
                      Keys.restaurant: restaurant,
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
      ),
    );
  }
}
