import 'package:flutter/material.dart';
import 'package:restr/src/constants/constants.dart';

extension XBuildContext on BuildContext {
  MediaQueryData get mediaQuery => Sizes.mediaQueryData(this);
  double get screenWidth => Sizes.screenWidth(this);
  double get screenHeight => Sizes.screenHeight(this);
  double get blockSizeHorizontal => Sizes.blockSizeHorizontal(this);
  double get blockSizeVertical => Sizes.blockSizeVertical(this);
  double get safeBlockHorizontal => Sizes.safeBlockHorizontal(this);
  double get safeBlockVertical => Sizes.safeBlockVertical(this);
}
