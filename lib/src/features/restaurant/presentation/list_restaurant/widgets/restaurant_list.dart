import 'package:flutter/material.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/presentation/list_restaurant/widgets/restaurant_list_tile.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: Sizes.p20),
          child: RestaurantListTile(),
        );
      },
    );
  }
}
