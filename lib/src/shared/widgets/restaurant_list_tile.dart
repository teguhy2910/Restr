import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/domain/restaurants.dart';
import 'package:restr/src/shared/extensions/extensions.dart';
import 'package:restr/src/shared/helper/hero_builder.dart';

class RestaurantListTile extends StatelessWidget {
  const RestaurantListTile({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.p20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.p20),
        color: AppThemes.lightGrey,
      ),
      child: Row(
        children: [
          ImageWithRating(restaurant: restaurant),
          Gap.w20,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: AppThemes.text1.bold,
                ),
                Gap.h8,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      color: AppThemes.grey,
                      size: Sizes.p16,
                    ),
                    Gap.w4,
                    Text(
                      restaurant.city,
                      style: AppThemes.subText1.grey,
                    ),
                  ],
                ),
                Gap.h16,
                Text(
                  'Paket ${restaurant.menus.foods.first.name}, ${restaurant.menus.drinks.first.name}, dan aneka makanan minuman lainnya!',
                  style: AppThemes.subText1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageWithRating extends StatelessWidget {
  const ImageWithRating({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * 0.24,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Hero(
            tag: 'image:${restaurant.id}',
            flightShuttleBuilder: heroFlightShuttleBuilder,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.p12),
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: CachedNetworkImage(
                  imageUrl: restaurant.pictureId,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -Sizes.p12,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.p4,
                horizontal: Sizes.p8,
              ),
              decoration: BoxDecoration(
                color: AppThemes.white,
                borderRadius: BorderRadius.circular(Sizes.p20),
                boxShadow: AppThemes.getSmallShadow(),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: AppThemes.orange,
                    size: Sizes.p12,
                  ),
                  Gap.w8,
                  Text(
                    restaurant.rating.toStringAsFixed(1),
                    style: AppThemes.subText1.bold,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
