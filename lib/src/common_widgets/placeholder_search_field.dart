import 'package:flutter/material.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/shared/extensions/extensions.dart';

class PlaceholderSearchField extends StatelessWidget {
  const PlaceholderSearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}