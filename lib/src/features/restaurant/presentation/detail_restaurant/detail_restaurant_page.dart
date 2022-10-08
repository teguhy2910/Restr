import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:restr/src/common_widgets/common_widgets.dart';
import 'package:restr/src/common_widgets/custom_back_button.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/exceptions/network_exceptions.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_detail.dart';
import 'package:restr/src/features/restaurant/presentation/detail_restaurant/controllers/detail_restaurant_controller.dart';
import 'package:restr/src/features/restaurant/presentation/detail_restaurant/widgets/basic_information_restaurant.dart';
import 'package:restr/src/features/restaurant/presentation/detail_restaurant/widgets/image_with_back_button.dart';
import 'package:restr/src/features/restaurant/presentation/detail_restaurant/widgets/menu_list_tile.dart';
import 'package:restr/src/features/restaurant/presentation/detail_restaurant/widgets/review_list_tile.dart';
import 'package:restr/src/features/review/presentation/add_review/add_review_widget.dart';
import 'package:restr/src/shared/helper/helper.dart';

class DetailRestaurantPage extends ConsumerStatefulWidget {
  final String restaurantId;
  const DetailRestaurantPage({
    Key? key,
    required this.restaurantId,
  }) : super(key: key);

  @override
  ConsumerState<DetailRestaurantPage> createState() =>
      _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends ConsumerState<DetailRestaurantPage> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      ref
          .read(detailRestaurantControllerProvider.notifier)
          .getRestaurantById(id: widget.restaurantId);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final restaurantDetail = ref.watch(detailRestaurantControllerProvider);
    return Scaffold(
      body: AsyncValueWidget<RestaurantDetail>(
        value: restaurantDetail,
        loading: () {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                BackButton(),
                Expanded(
                  child: LottieWidget(assets: Resources.lottieLoading),
                ),
              ],
            ),
          );
        },
        error: (error, stacktrace) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.p20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButton(),
                  Expanded(
                    child: LottieWidget(
                      assets: Resources.lottieError,
                      description: NetworkExceptions.getErrorMessage(
                        error as NetworkExceptions,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        data: (restaurant) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageWithBackButton(restaurant: restaurant),
                Gap.h20,
                SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.p20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BasicInformationRestaurant(restaurant: restaurant),
                        Gap.h32,
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
                        Gap.h32,
                        Text(
                          'Foods',
                          style: AppThemes.headline3,
                        ),
                        Gap.h12,
                        _buildFoodList(restaurant),
                        Gap.h20,
                        Text(
                          'Drinks',
                          style: AppThemes.headline3,
                        ),
                        Gap.h12,
                        _buildDrinkList(restaurant),
                        Gap.h40,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Reviews',
                              style: AppThemes.headline3,
                            ),
                            GestureDetector(
                              onTap: () {
                                showRegularBottomSheet(
                                  context,
                                  child: AddReviewWidget(
                                    restaurantId: restaurant.id,
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.add_rounded,
                                color: AppThemes.green,
                              ),
                            ),
                          ],
                        ),
                        Gap.h12,
                        _buildCustomerReviewList(restaurant),
                        Gap.h20,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFoodList(RestaurantDetail restaurant) {
    return SizedBox(
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
    );
  }

  Widget _buildDrinkList(RestaurantDetail restaurant) {
    return SizedBox(
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
    );
  }

  Widget _buildCustomerReviewList(RestaurantDetail restaurant) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 0),
      itemCount: restaurant.customerReviews.length,
      itemBuilder: (context, index) {
        final customerReview = restaurant.customerReviews[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: Sizes.p20),
          child: ReviewListTile(customerReview: customerReview),
        );
      },
    );
  }
}
