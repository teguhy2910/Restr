import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/domain/restaurants.dart';
import 'package:restr/src/shared/helper/hero_builder.dart';

class ImageWithBackButton extends StatelessWidget {
  const ImageWithBackButton({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Hero(
            tag: 'image:${restaurant.id}',
            flightShuttleBuilder: heroFlightShuttleBuilder,
            child: ClipRRect(
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
          ),
          Positioned(
            top: 0,
            left: Sizes.p20,
            child: SafeArea(
              child: GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  padding: const EdgeInsets.all(Sizes.p8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppThemes.white,
                    boxShadow: AppThemes.getSmallShadow(),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppThemes.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
