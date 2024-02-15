part of 'extensions.dart';

extension StringExtension on String {
  String get toFirstUppercase =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  String get flattenGeneric =>
      replaceAll(RegExp(r'[_ ]'), '').toLowerCase().trim();

  String upperCaseWords() {
    return split(' ')
        .map((word) => '${word[0].toUpperCase()}${word.substring(1)}')
        .join(' ');
  }

  List<String> get chars => split('');

  String removeAll(String pattern) {
    return replaceAll(pattern, '');
  }

  String normalizeSnakeCase() {
    return replaceAll('_', ' ').toLowerCase();
  }

  String get withoutWhiteSpace => removeAll(' ');

  List<int> get utf8Encoded => utf8.encode(this);

  Uint8List toByteList() => hexToUint8List(this);

  Uint8List toUInt8List() => Uint8List.fromList(codeUnits);

  String? get nullIfEmpty => isEmpty ? null : this;
}

String stringFromUtf8Encoded(List<int> data) => utf8.decode(data);


extension NullableStringExtension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}