import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restr/src/common_widgets/common_widgets.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/domain/restaurant.dart';
import 'package:restr/src/features/restaurant/presentation/favorite_restaurant/controllers/favorites_controller.dart';
import 'package:restr/src/features/restaurant/presentation/favorite_restaurant/controllers/result_favorite_text.dart';
import 'package:restr/src/features/restaurant/presentation/favorite_restaurant/controllers/search_favorites_controller.dart';
import 'package:restr/src/routing/routing.dart';

class FavoriteListWidget extends ConsumerStatefulWidget {
  const FavoriteListWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<FavoriteListWidget> createState() => _RestaurantListState();
}

class _RestaurantListState extends ConsumerState<FavoriteListWidget> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      ref.read(favoritesControllerProvider.notifier).getAllFavoriteRestaurant();
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final List<Restaurant> restaurants = ref.watch(favoritesControllerProvider);
    final List<Restaurant> searchRestaurants =
        ref.watch(searchFavoriteControllerProvider);
    final String textResult = ref.watch(resultFavoriteTextControllerProvider);

    if (searchRestaurants.isNotEmpty && textResult.isNotEmpty) {
      return ListView.builder(
        itemCount: searchRestaurants.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final restaurant = searchRestaurants[index];
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
    }
    if (searchRestaurants.isEmpty && textResult.isNotEmpty) {
      return LottieWidget(
        assets: Resources.lottieEmpty,
        description: '"$textResult" not found!',
      );
    }
    if (restaurants.isEmpty) {
      return const LottieWidget(
        assets: Resources.lottieEmpty,
        description: 'Restaurant is Empty!',
      );
    }
    return ListView.builder(
      itemCount: restaurants.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
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
  }
}
