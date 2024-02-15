import 'dart:convert';
import 'dart:math';

import 'package:dessert_meal_app/src/tools/functions/functions_barrel.dart';

abstract class UtilFunctions {
  static String generateRandomID([int length = 16]) {
    final Random random = Random.secure();

    final List<int> values = List<int>.generate(
      length,
      (i) => random.nextInt(256),
    );
    return base64Url.encode(values);
  }

  static String generateID() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  static DateTime dateTimeFromSecondsSinceEpoch(int secondsSinceEpoch) {
    return DateTime.fromMillisecondsSinceEpoch(secondsSinceEpoch * 1000);
  }

  static String formatMinutesDuration(Duration duration) {
    final int inSeconds = duration.inSeconds;
    final int seconds = inSeconds % 60;
    final int minutes = inSeconds ~/ 60;

    return '${'$minutes'.padLeft(2, '0')}:${'$seconds'.padLeft(2, '0')}';
  }

  static bool compareQueries(String value, String query) {
    final String formattedValue = value.trim().toLowerCase();
    final List<String> queryWords = query.split(' ');
    if (queryWords.length == 1) {
      return formattedValue.contains(query.trim().toLowerCase());
    }
    bool hasMatch = false;
    for (String queryWord in queryWords) {
      hasMatch = formattedValue.contains(queryWord.trim().toLowerCase());
      if (hasMatch) return true;
    }
    return false;
  }

  static String formatNumberInput(num number) {
    String trailingDecimal = '';
    if (number is double) {
      trailingDecimal = '.${'$number'.split('.').last}0';
    }
    final String numText = number.toInt().toString();
    final int numLength = numText.length;

    String fullNumText = '';
    for (int i = _getHighestThreeMultiple(numLength); i >= 0; i -= 3) {
      bool onHighestPlaceValue = (_getHighestThreeMultiple(numLength) - i) < 3;
      bool onLowestPlaceValue = i <= 3;
      fullNumText += numText.substring(
        onHighestPlaceValue ? 0 : (numLength - i),
        onLowestPlaceValue ? null : numLength - (i - 3),
      );
      if (onLowestPlaceValue) return '$fullNumText$trailingDecimal';
      fullNumText += ',';
    }
    return '$fullNumText$trailingDecimal';
  }

  static String formatDate(DateTime dateTime) {
    final DateTime now = DateTime.now();

    final int year = dateTime.year;
    final int month = dateTime.month;
    final int day = dateTime.day;

    if (now.difference(dateTime).inDays == 0) return 'Today';

    if (now.difference(dateTime).inDays == 1) return 'Yesterday';

    return '$day/$month/$year';
  }

  static int _getHighestThreeMultiple(int numString) {
    if (numString % 3 == 0) return numString;
    return numString + (3 - (numString % 3));
  }

  static String getTimeAgo(DateTime date, {bool addAgo = false}) {
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(date);

    if (difference.inDays > 0) {
      return formatDate(date);
    }

    if (difference.inHours > 0) {
      return '${difference.inHours} hr${difference.inHours.pluralS}${addAgo ? ' ago' : ''}';
    }
    if (difference.inMinutes > 0) {
      return '${difference.inMinutes} min${difference.inMinutes.pluralS}${addAgo ? ' ago' : ''}';
    }
    return 'now';
  }
}
