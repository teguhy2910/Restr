// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/common_widgets/common_widgets.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/exceptions/network_exceptions.dart';
import 'package:restr/src/features/restaurant/presentation/detail_restaurant/controllers/detail_restaurant_controller.dart';
import 'package:restr/src/features/restaurant/presentation/search_restaurant/widgets/bottom_sheet_holder.dart';
import 'package:restr/src/features/restaurant/presentation/search_restaurant/widgets/regular_button.dart';
import 'package:restr/src/features/review/presentation/add_review/controllers/add_review_controller.dart';
import 'package:restr/src/shared/extensions/extensions.dart';
import 'package:restr/src/shared/helper/helper.dart';

class AddReviewWidget extends ConsumerWidget {
  final String restaurantId;
  const AddReviewWidget({
    Key? key,
    required this.restaurantId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValueAddReview = ref.watch(addReviewControllerProvider);
    ref.listen<AsyncValue<void>>(
      addReviewControllerProvider,
      (previous, next) {
        next.maybeWhen(
          data: (data) {
            ref
                .read(detailRestaurantControllerProvider.notifier)
                .getRestaurantById(id: restaurantId);
            Navigator.of(context).pop();
            showSuccessSnackbar(context, 'Success Add Review!');
          },
          orElse: (() {}),
        );
      },
    );
    return Material(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.all(20),
          color: AppThemes.white,
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BottomSheetHolder(),
                Gap.h20,
                Text(
                  'Add Review',
                  style: AppThemes.headline3,
                  textAlign: TextAlign.start,
                ),
                Gap.h20,
                InputTextField(
                  hintText: 'Input your name here...',
                  labelText: 'Name',
                  onChanged: ((value) {
                    ref
                        .read(addReviewControllerProvider.notifier)
                        .nameChanged(value);
                  }),
                ),
                Gap.h20,
                TextFieldArea(
                  hintText: 'Input your Reviews here...',
                  labelText: 'Review',
                  onChanged: ((value) {
                    ref
                        .read(addReviewControllerProvider.notifier)
                        .reviewChanged(value);
                  }),
                ),
                Gap.h40,
                RegularButton(
                  text: 'Submit',
                  isLoading: asyncValueAddReview.isLoading,
                  onPressed: () {
                    ref.read(addReviewControllerProvider.notifier).postReview(
                          restaurantId: restaurantId,
                        );
                  },
                ),
                Gap.h20,
                asyncValueAddReview.maybeWhen(
                  error: (error, stacktrace) => Text(
                    'Failed Add Review!: ${NetworkExceptions.getErrorMessage(error as NetworkExceptions)}',
                    style: AppThemes.text1.red,
                  ),
                  orElse: () => Container(),
                ),
                Gap.h20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
