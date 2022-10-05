import 'package:flutter/material.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/shared/extensions/extensions.dart';

class BottomSheetHolder extends StatelessWidget {
  const BottomSheetHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.p12),
          color: AppThemes.black,
        ),
        height: Sizes.p4,
        width: context.screenWidth * 0.12,
      ),
    );
  }
}
