import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restr/src/common_widgets/custom_back_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/application/restaurant_mapper.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_detail.dart';
import 'package:restr/src/features/restaurant/presentation/favorite_restaurant/controllers/favorites_controller.dart';

class ImageWithBackButton extends StatelessWidget {
  const ImageWithBackButton({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final RestaurantDetail restaurant;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(Sizes.p32),
            ),
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: CachedNetworkImage(
                imageUrl: restaurant.pictureId,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            top: Sizes.p20,
            left: Sizes.p20,
            child: SafeArea(
              child: CustomBackButton(),
            ),
          ),
          Positioned(
            top: Sizes.p20,
            right: Sizes.p20,
            child: SafeArea(
              child: Consumer(builder: (context, ref, child) {
                bool isFavorite = ref
                    .read(favoritesControllerProvider.notifier)
                    .isFavoriteRestaurantExist(restaurantId: restaurant.id);
                debugPrint('isFavorite: $isFavorite');
                return GestureDetector(
                  onTap: () {
                    ref
                        .read(favoritesControllerProvider.notifier)
                        .favoriteOnClick(
                            restaurant:
                                RestaurantMapper.mapToRestaurant(restaurant));
                    ref
                        .read(favoritesControllerProvider.notifier)
                        .getAllFavoriteRestaurant();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(Sizes.p8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppThemes.white,
                      boxShadow: AppThemes.getSmallShadow(),
                    ),
                    child: Icon(
                      !ref
                              .watch(favoritesControllerProvider.notifier)
                              .isFavoriteRestaurantExist(
                                  restaurantId: restaurant.id)
                          ? Icons.favorite_border_rounded
                          : Icons.favorite_rounded,
                      color: Colors.red,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
