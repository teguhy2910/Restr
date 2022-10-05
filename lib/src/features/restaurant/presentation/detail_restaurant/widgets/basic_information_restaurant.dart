// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_detail.dart';
import 'package:restr/src/features/restaurant/presentation/detail_restaurant/widgets/category_list_tile.dart';
import 'package:restr/src/shared/extensions/extensions.dart';

class BasicInformationRestaurant extends StatelessWidget {
  const BasicInformationRestaurant({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final RestaurantDetail restaurant;

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
                    '${restaurant.address}, ${restaurant.city}',
                    style: AppThemes.text2.grey,
                  ),
                ],
              ),
              Gap.h8,
              Wrap(
                children: restaurant.categories
                    .map((item) => CategoryListTile(name: item.name))
                    .toList(),
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
