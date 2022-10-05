import 'package:flutter/material.dart';
import 'package:restr/src/common_widgets/common_widgets.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/presentation/list_restaurant/widgets/restaurant_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              const PlaceholderSearchField(),
              Gap.h40,
              Text(
                'Recommended for you',
                style: AppThemes.headline2,
              ),
              Gap.h20,
              const RestaurantListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
