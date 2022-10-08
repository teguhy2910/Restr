import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restr/src/common_widgets/custom_back_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/application/restaurant_mapper.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_detail.dart';
import 'package:restr/src/features/restaurant/presentation/favorite_restaurant/controllers/favorites_controller.dart';
import 'package:restr/src/features/restaurant/presentation/favorite_restaurant/controllers/is_favorite_controller.dart';

class ImageWithBackButton extends ConsumerStatefulWidget {
  const ImageWithBackButton({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final RestaurantDetail restaurant;

  @override
  ConsumerState<ImageWithBackButton> createState() =>
      _ImageWithBackButtonState();
}

class _ImageWithBackButtonState extends ConsumerState<ImageWithBackButton> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      ref
          .read(isFavoriteControllerProvider.notifier)
          .isFavoriteRestaurantExist(restaurantId: widget.restaurant.id);
    });
    super.didChangeDependencies();
  }

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
                imageUrl: widget.restaurant.pictureId,
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
                bool isFavorite = ref.watch(isFavoriteControllerProvider);
                debugPrint('isFavorite here: $isFavorite');
                return GestureDetector(
                  onTap: () {
                    ref
                        .read(favoritesControllerProvider.notifier)
                        .favoriteOnClick(
                            restaurant: RestaurantMapper.mapToRestaurant(
                                widget.restaurant));
                    ref
                        .read(isFavoriteControllerProvider.notifier)
                        .isFavoriteRestaurantExist(
                            restaurantId: widget.restaurant.id);
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
                      !isFavorite
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
