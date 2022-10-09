import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/presentation/favorite_restaurant/controllers/result_favorite_text.dart';
import 'package:restr/src/features/restaurant/presentation/favorite_restaurant/controllers/search_favorites_controller.dart';
import 'package:restr/src/features/restaurant/presentation/favorite_restaurant/widgets/favorite_list_widget.dart';
import 'package:restr/src/features/restaurant/presentation/search_restaurant/widgets/search_field.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap.h20,
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return SearchField(
                    hintText: 'Search your favorite restaurant here...',
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        ref
                            .read(searchFavoriteControllerProvider.notifier)
                            .searchFavoriteRestaurant(query: value);
                      }
                      ref
                          .read(resultFavoriteTextControllerProvider.notifier)
                          .search(name: value);
                    },
                  );
                },
              ),
              Gap.h40,
              Consumer(
                builder: (context, ref, child) {
                  final result =
                      ref.watch(resultFavoriteTextControllerProvider);
                  if (result.isNotEmpty) {
                    return Text(
                      'Results for "$result"',
                      style: AppThemes.headline3,
                    );
                  }
                  return Text(
                    'Your Favorite Restaurants',
                    style: AppThemes.headline2,
                  );
                },
              ),
              Gap.h20,
              const FavoriteListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
