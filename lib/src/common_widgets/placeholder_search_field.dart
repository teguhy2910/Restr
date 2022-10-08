// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/routing/routing.dart';
import 'package:restr/src/shared/extensions/extensions.dart';

class PlaceholderSearchField extends StatelessWidget {
  final String placeholderText;
  const PlaceholderSearchField({
    Key? key,
    required this.placeholderText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.searchRestaurant.name),
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
                placeholderText,
                style: AppThemes.text2.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
