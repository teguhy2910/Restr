import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/presentation/search_restaurant/controllers/result_search_text.dart';
import 'package:restr/src/features/restaurant/presentation/search_restaurant/controllers/search_restaurant_controller.dart';
import 'package:restr/src/shared/extensions/extensions.dart';
import 'package:restr/src/shared/helper/hero_builder.dart';

class SearchField extends ConsumerWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Hero(
      tag: Keys.heroSearchField,
      flightShuttleBuilder: heroFlightShuttleBuilder,
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
          fillColor: AppThemes.lightGrey,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Sizes.p20),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppThemes.grey,
          ),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16, vertical: Sizes.p12),
          hintText: 'What do you want to eat today?',
          hintStyle: AppThemes.text2.grey,
        ),
        onChanged: (value) {
          ref
              .read(searchRestaurantControllerProvider.notifier)
              .searchRestaurant(name: value);
          ref
              .read(resultSearchTextControllerProvider.notifier)
              .search(name: value);
        },
      ),
    );
  }
}
