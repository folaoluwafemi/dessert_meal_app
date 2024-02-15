import 'package:dessert_meal_app/src/tools/tools_barrel.dart';

abstract class PresenterState extends VanillaState {
  final bool success;
  final bool loading;
  final Failure? error;

  const PresenterState({
    required this.success,
    required this.loading,
    this.error,
  });

  dynamic copyWith({
    bool? success,
    bool? loading,
    Failure? error,
  });
}
