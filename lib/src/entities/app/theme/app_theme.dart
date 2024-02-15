import 'package:dessert_meal_app/src/entities/app/app_barrel.dart';
import 'package:flutter/material.dart';

final class AppTheme {
  static ThemeData get light => _lightTheme;
}

final ThemeData _lightTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  extensions: [
    const ColorPalette.light(),
    AppTypography.fromDesign(),
  ],
);
