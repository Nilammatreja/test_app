import 'package:flutter/material.dart';

/// All app colors are defined here
class AppColors {
  AppColors._();

  static MaterialColor primaryPalette = MaterialColor(
    colorBE002D.value,
    <int, Color>{
      50: colorBE002D.withAlpha(10),
      100: colorBE002D.withAlpha(20),
      200: colorBE002D.withAlpha(30),
      300: colorBE002D.withAlpha(40),
      400: colorBE002D.withAlpha(50),
      500: colorBE002D.withAlpha(60),
      600: colorBE002D.withAlpha(70),
      700: colorBE002D.withAlpha(80),
      800: colorBE002D.withAlpha(90),
      900: colorBE002D.withAlpha(100),
    },
  );

  static const Color colorWhite = Color(0xFFFFFFFF);
  static const Color colorBlack = Color(0xFF000000);
  static const Color colorCBCBCB = Color(0xFFCBCBCB);
  static const Color colorBE002D = Color(0xFFBE002D);
  static const Color colorShadow = Color(0x00000029);
  static const Color color5A5A5A = Color(0xFF5A5A5A);
  static const Color color1C1C1C = Color(0xFF1C1C1C);

  static const Color colorShimmerBase = Color(0xFFE0E0E0);
  static const Color colorShimmerHighlight = Color(0xFFF5F5F5);
  static const Color colorShimmer = Color(0xFFBDBDBD);
}
