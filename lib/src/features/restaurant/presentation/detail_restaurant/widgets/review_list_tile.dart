import 'package:flutter/material.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/domain/restaurant_detail.dart';
import 'package:restr/src/shared/extensions/extensions.dart';

class ReviewListTile extends StatelessWidget {
  const ReviewListTile({
    Key? key,
    required this.customerReview,
  }) : super(key: key);

  final CustomerReview customerReview;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.p20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.p20),
        color: AppThemes.lightGrey,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '"${customerReview.review}"',
            style: AppThemes.text1.bold,
          ),
          Gap.h8,
          Text(
            '- ${customerReview.name}, ${customerReview.date}',
            style: AppThemes.text2,
          ),
        ],
      ),
    );
  }
}
