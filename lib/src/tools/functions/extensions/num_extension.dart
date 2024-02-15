part of 'extensions.dart';

num doubleToStringWithTwoDecimals(double value) {
  // Convert the double to a string.
  String stringValue = value.toString();

  // Find the position of the decimal point.
  int decimalPointIndex = stringValue.indexOf('.');

  if (decimalPointIndex != -1) {
    // If the decimal point exists, check if there are only ".0"s after it.
    bool hasOnlyZeros = stringValue
        .substring(decimalPointIndex + 1)
        .replaceAll('0', '')
        .isEmpty;
    if (hasOnlyZeros) {
      // If only ".0"s are present, return the integer part as a string.
      return num.parse(stringValue.substring(0, decimalPointIndex));
    } else {
      // If there are non-zero decimals, truncate the string to two decimal places.
      return num.parse(stringValue.substring(
        0,
        decimalPointIndex + 3,
      )); // +3 to include two decimal places.
    }
  } else {
    // If there is no decimal point, return the integer part as a string.
    return num.parse(stringValue);
  }
}

extension AppSizerDoubleExtension on num {
  SizedBox get boxWidth => SizedBox(width: toDouble());

  SizedBox get boxHeight => SizedBox(height: toDouble());

  SliverToBoxAdapter get sliverBoxWidth => SliverToBoxAdapter(
        child: SizedBox(width: toDouble()),
      );

  SliverToBoxAdapter get sliverBoxHeight => SliverToBoxAdapter(
        child: SizedBox(height: toDouble()),
      );

  double get half => this / 2;

  double get sixth => this / 6;

  double get third => this / 3;

  double get twoThirds => this * 2 / 3;

  double get doubled => this * 2;

  double percent(double value) => this * value / 100;

  double ratio(double value) => this * value;

  double get toRadians => this * (math.pi / 180);

  double get pi => this * math.pi;

  num get oneIfZero => this == 0 ? 1 : this;

  int get zeroIfLess => this < 0 ? 0 : (this as int);

  double? get nullIfZero => this == 0 ? null : (this as double);

  bool isAround(num other, {double offBy = 2}) {
    return other >= this - 2 && other < (this + 2);
  }

  bool isAroundOrGreaterThan(num other, {double offBy = 2}) {
    return this >= other + 2 || isAround(other, offBy: offBy);
  }

  bool isAroundOrLessThan(num other, {double offBy = 2}) {
    return this <= other - 2 || isAround(other, offBy: offBy);
  }

  String toOrdinal() {
    final int number = toInt();
    final int remainder = number % 100;

    if (remainder >= 11 && remainder <= 13) {
      return '${number}th';
    }

    switch (number % 10) {
      case 1:
        return '${number}st';
      case 2:
        return '${number}nd';
      case 3:
        return '${number}rd';
      default:
        return '${number}th';
    }
  }

  String get pluralS {
    if (this == 1) {
      return '';
    }
    return 's';
  }
}

extension DoubleExtension on double {
  num get toJsNumber => doubleToStringWithTwoDecimals(this);
}

extension IntExtension on int {
  List<int> range([int start = 1]) => List<int>.generate(
        this,
        (int index) => index + start,
      );

  Duration get seconds => Duration(seconds: this);
}

extension GenericNumExtension<T extends num> on T {
  T capAt(T cap) => this >= cap ? cap : this;

  T capBetween(T min, T max) => this >= max
      ? max
      : this <= min
          ? min
          : this;
}
