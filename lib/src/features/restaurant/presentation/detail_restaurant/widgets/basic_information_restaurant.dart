import 'package:flutter/material.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/domain/restaurants.dart';
import 'package:restr/src/shared/extensions/extensions.dart';

class BasicInformationRestaurant extends StatelessWidget {
  const BasicInformationRestaurant({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: AppThemes.headline2.bold,
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
                    style: AppThemes.text1.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.p8,
            horizontal: Sizes.p16,
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
              ),
              Gap.w8,
              Text(
                restaurant.rating.toStringAsFixed(1),
                style: AppThemes.headline3.bold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
