import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/presentation/search_restaurant/controllers/result_search_text.dart';
import 'package:restr/src/features/restaurant/presentation/search_restaurant/widgets/search_field.dart';
import 'package:restr/src/features/restaurant/presentation/search_restaurant/widgets/search_restaurant_list.dart';

class SearchRestaurantPage extends StatelessWidget {
  const SearchRestaurantPage({Key? key}) : super(key: key);

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
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppThemes.black,
                    ),
                  ),
                  Gap.w16,
                  const Expanded(
                    child: SearchField(),
                  ),
                ],
              ),
              Gap.h40,
              Consumer(
                builder: (context, ref, child) {
                  final result = ref.watch(resultSearchTextControllerProvider);
                  if (result.isNotEmpty) {
                    return Text(
                      'Results for "$result"',
                      style: AppThemes.headline3,
                    );
                  }
                  return Container();
                },
              ),
              Gap.h20,
              const SearchRestaurantList(),
            ],
          ),
        ),
      ),
    );
  }
}
