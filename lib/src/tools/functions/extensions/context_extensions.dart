part of 'extensions.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  ColorPalette get palette => theme.extension<ColorPalette>()!;

  Color get primary => palette.primary;

  Color get secondary => palette.secondary;

  Color get textBlack => palette.textBlack;

  Color get textGrey => palette.textGrey;

  Color get background => palette.background;

  AppTypography get typography => theme.extension<AppTypography>()!;

  TextStyle get titleLarge => typography.titleLarge;

  TextStyle get titleMedium => typography.titleMedium;

  TextStyle get titleSmall => typography.titleSmall;

  TextStyle get bodyMedium => typography.bodyMedium;

  TextStyle get bodySmall => typography.bodySmall;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get topScreenPadding => mediaQuery.viewPadding.top;

  double get screenWidth => mediaQuery.size.width;

  double get screenHeight => mediaQuery.size.height;
}
