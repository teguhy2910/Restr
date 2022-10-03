import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static const Color scaffoldColor = Color(0xFFFFFFFF);
  static const Color orange = Color(0xFFFAB400);
  static const Color green = Color(0xFF11AC6A);
  static const Color greenGrey = Color(0xFFD6FFEE);
  static const Color white = Colors.white;
  static const Color lightGrey = Color(0xFFF6F7FB);
  static const Color grey = Color(0xFFA4A4A4);
  static const Color black = Color(0xFF111111);

  static TextStyle headline1 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: black,
  );

  static TextStyle headline2 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: black,
  );

  static TextStyle headline3 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: black,
  );

  static TextStyle text1 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: black,
  );

  static TextStyle text2 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: black,
  );

  static TextStyle subText1 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w300,
    color: black,
  );

  static List<BoxShadow> getShadow(Color color) {
    return [
      BoxShadow(
        color: color.withOpacity(0.2),
        offset: const Offset(0, 4),
        blurRadius: 20,
        spreadRadius: 4,
      ),
    ];
  }

  static List<BoxShadow> getSmallShadow({Color color = grey}) {
    return [
      BoxShadow(
        color: AppThemes.grey.withOpacity(0.2),
        offset: const Offset(0, 2),
        blurRadius: 4,
      ),
    ];
  }
}
