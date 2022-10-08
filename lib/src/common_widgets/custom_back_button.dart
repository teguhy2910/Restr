import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restr/src/constants/constants.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Container(
        padding: const EdgeInsets.all(Sizes.p8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppThemes.white,
          boxShadow: AppThemes.getSmallShadow(),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppThemes.black,
        ),
      ),
    );
  }
}
