import 'package:flutter/material.dart';

class Sizes {
  static const p4 = 4.0;
  static const p8 = 8.0;
  static const p12 = 12.0;
  static const p16 = 16.0;
  static const p20 = 20.0;
  static const p24 = 24.0;
  static const p28 = 28.0;
  static const p32 = 32.0;
  static const p36 = 36.0;
  static const p40 = 40.0;
  static const p48 = 48.0;
  static const p56 = 56.0;
  static const p64 = 64.0;
  static const p72 = 72.0;
  static const p80 = 80.0;
  static const p96 = 96.0;

  static MediaQueryData mediaQueryData(BuildContext context) =>
      MediaQuery.of(context);
  static double screenWidth(BuildContext context) =>
      mediaQueryData(context).size.width;
  static double screenHeight(BuildContext context) =>
      mediaQueryData(context).size.height;
  static double blockSizeHorizontal(BuildContext context) =>
      screenWidth(context) / 100;
  static double blockSizeVertical(BuildContext context) =>
      screenHeight(context) / 100;

  static double _safeAreaHorizontal(BuildContext context) =>
      blockSizeHorizontal(context) * 10;
  static double _safeAreaVertical(BuildContext context) =>
      blockSizeVertical(context) * 10;
  static double safeBlockHorizontal(BuildContext context) =>
      (_safeAreaHorizontal(context) / 100) * 10;
  static double safeBlockVertical(BuildContext context) =>
      (_safeAreaVertical(context) / 100) * 10;
}

class Gap {
  /// Constant gap widths
  static const w4 = SizedBox(width: Sizes.p4);
  static const w8 = SizedBox(width: Sizes.p8);
  static const w12 = SizedBox(width: Sizes.p12);
  static const w16 = SizedBox(width: Sizes.p16);
  static const w20 = SizedBox(width: Sizes.p20);
  static const w24 = SizedBox(width: Sizes.p24);
  static const w28 = SizedBox(width: Sizes.p28);
  static const w32 = SizedBox(width: Sizes.p32);
  static const w36 = SizedBox(width: Sizes.p36);
  static const w40 = SizedBox(width: Sizes.p40);
  static const w48 = SizedBox(width: Sizes.p48);
  static const w56 = SizedBox(width: Sizes.p56);
  static const w64 = SizedBox(width: Sizes.p64);
  static const w72 = SizedBox(width: Sizes.p72);
  static const w80 = SizedBox(width: Sizes.p80);

  /// Constant gap heights
  static const h4 = SizedBox(height: Sizes.p4);
  static const h8 = SizedBox(height: Sizes.p8);
  static const h12 = SizedBox(height: Sizes.p12);
  static const h16 = SizedBox(height: Sizes.p16);
  static const h20 = SizedBox(height: Sizes.p20);
  static const h24 = SizedBox(height: Sizes.p24);
  static const h28 = SizedBox(height: Sizes.p28);
  static const h32 = SizedBox(height: Sizes.p32);
  static const h36 = SizedBox(height: Sizes.p36);
  static const h40 = SizedBox(height: Sizes.p40);
  static const h48 = SizedBox(height: Sizes.p48);
  static const h56 = SizedBox(height: Sizes.p56);
  static const h64 = SizedBox(height: Sizes.p64);
  static const h72 = SizedBox(height: Sizes.p72);
  static const h80 = SizedBox(height: Sizes.p80);
}
