import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:restr/src/constants/constants.dart';

import 'package:restr/src/features/restaurant/domain/restaurants.dart';
import 'package:restr/src/features/restaurant/presentation/detail_restaurant/widgets/basic_information_restaurant.dart';
import 'package:restr/src/features/restaurant/presentation/detail_restaurant/widgets/image_with_back_button.dart';
import 'package:restr/src/features/restaurant/presentation/detail_restaurant/widgets/menu_list_tile.dart';

class DetailRestaurantPage extends StatelessWidget {
  final Restaurant restaurant;
  const DetailRestaurantPage({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWithBackButton(restaurant: restaurant),
            Gap.h20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BasicInformationRestaurant(restaurant: restaurant),
                  Gap.h20,
                  ReadMoreText(
                    restaurant.description,
                    trimLines: 6,
                    textAlign: TextAlign.justify,
                    colorClickableText: AppThemes.green,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    style: AppThemes.text2,
                  ),
                  Gap.h20,
                  Text(
                    'Foods',
                    style: AppThemes.headline3,
                  ),
                  Gap.h12,
                  SizedBox(
                    height: Sizes.p40,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: restaurant.menus.foods.length,
                      itemBuilder: (context, index) {
                        final food = restaurant.menus.foods[index];
                        return MenuListTile(menu: food.name);
                      },
                    ),
                  ),
                  Gap.h20,
                  Text(
                    'Drinks',
                    style: AppThemes.headline3,
                  ),
                  Gap.h12,
                  SizedBox(
                    height: Sizes.p40,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: restaurant.menus.foods.length,
                      itemBuilder: (context, index) {
                        final drink = restaurant.menus.drinks[index];
                        return MenuListTile(menu: drink.name);
                      },
                    ),
                  ),
                  Gap.h20,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
