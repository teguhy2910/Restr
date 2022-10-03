import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restr/src/shared/extensions/extensions.dart';

import '../constants/constants.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({
    Key? key,
    required this.assets,
    this.description,
  }) : super(key: key);

  final String assets;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.6,
      child: Center(
        child: description != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    assets,
                    width: context.screenWidth * 0.7,
                    fit: BoxFit.fitWidth,
                  ),
                  Gap.h16,
                  Text(
                    description!,
                    style: AppThemes.headline2,
                  ),
                ],
              )
            : Lottie.asset(
                assets,
                width: context.screenWidth * 0.7,
                fit: BoxFit.fitWidth,
              ),
      ),
    );
  }
}
