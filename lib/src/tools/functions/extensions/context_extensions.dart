part of 'extensions.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get topScreenPadding => mediaQuery.viewPadding.top;

  double get screenWidth => mediaQuery.size.width;

  double get screenHeight => mediaQuery.size.height;
}
