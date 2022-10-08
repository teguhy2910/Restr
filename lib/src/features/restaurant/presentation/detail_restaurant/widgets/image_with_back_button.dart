import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restr/src/common_widgets/custom_back_button.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_detail.dart';
import 'package:restr/src/shared/helper/helper.dart';

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
          const Positioned(
            top: Sizes.p20,
            left: Sizes.p20,
            child: SafeArea(
              child: CustomBackButton(),
            ),
          ),
        ],
      ),
    );
  }
}
