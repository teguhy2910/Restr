import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restr/src/common_widgets/common_widgets.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_list.dart';
import 'package:restr/src/features/restaurant/presentation/list_restaurant/controllers/restaurant_list_controller.dart';
import 'package:restr/src/routing/app_routes.dart';
import 'package:restr/src/routing/extras.dart';

class RestaurantListWidget extends ConsumerStatefulWidget {
  const RestaurantListWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<RestaurantListWidget> createState() => _RestaurantListState();
}

class _RestaurantListState extends ConsumerState<RestaurantListWidget> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      ref.read(restaurantListControllerProvider.notifier).getRestaurantList();
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<RestaurantList> restaurants =
        ref.watch(restaurantListControllerProvider);

    return AsyncValueWidget<RestaurantList>(
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
      ),
    );
  }
}
