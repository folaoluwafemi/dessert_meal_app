import 'package:dessert_meal_app/src/project/app/app_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class AppTheme {
  static ThemeData get light => _lightTheme;
}

final ThemeData _lightTheme = ThemeData(
  primaryColor: AppColors.primary,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: AppColors.background,
  ),
  scaffoldBackgroundColor: AppColors.background,
  extensions: [
    const ColorPalette.light(),
    AppTypography.fromDesign(),
  ],
);
