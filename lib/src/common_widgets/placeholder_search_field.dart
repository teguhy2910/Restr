import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/routing/app_routes.dart';
import 'package:restr/src/shared/extensions/extensions.dart';
import 'package:restr/src/shared/helper/helper.dart';

class PlaceholderSearchField extends StatelessWidget {
  const PlaceholderSearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.searchRestaurant.name),
      child: Hero(
        tag: Keys.heroSearchField,
        flightShuttleBuilder: heroFlightShuttleBuilder,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16, vertical: Sizes.p12),
          decoration: BoxDecoration(
            color: AppThemes.lightGrey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.search_rounded,
                color: AppThemes.grey,
              ),
              Gap.w12,
              Expanded(
                child: Text(
                  'What do you want to eat today?',
                  style: AppThemes.text2.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
