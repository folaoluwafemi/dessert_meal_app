import 'package:flutter/material.dart';

class ColorPalette extends ThemeExtension<ColorPalette> {
  final Color primary;
  final Color secondary;
  final Color textBlack;
  final Color textGrey;
  final Color background;

  const ColorPalette({
    required this.primary,
    required this.secondary,
    required this.textBlack,
    required this.textGrey,
    required this.background,
  });

  @override
  ThemeExtension<ColorPalette> copyWith({
    Color? primary,
    Color? secondary,
    Color? textBlack,
    Color? textGrey,
    Color? background,
  }) {
    return ColorPalette(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      textBlack: textBlack ?? this.textBlack,
      textGrey: textGrey ?? this.textGrey,
      background: background ?? this.background,
    );
  }

  @override
  ThemeExtension<ColorPalette> lerp(
    covariant ThemeExtension<ColorPalette>? other,
    double t,
  ) {
    if (other == null) return this;
    other = other as ColorPalette;
    return ColorPalette(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      textBlack: Color.lerp(textBlack, other.textBlack, t)!,
      textGrey: Color.lerp(textGrey, other.textGrey, t)!,
      background: Color.lerp(background, other.background, t)!,
    );
  }
}
