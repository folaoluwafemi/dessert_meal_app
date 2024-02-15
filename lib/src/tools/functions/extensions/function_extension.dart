part of 'extensions.dart';

extension FunctionExtension<T extends Object?> on T Function() {
  T? nullableCall() {
    try {
      return call();
    } catch (e) {
      return null;
    }
  }
}
