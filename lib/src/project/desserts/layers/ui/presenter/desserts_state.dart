part of 'desserts_presenter.dart';

class DessertsState extends PresenterState {
  final List<Dessert> desserts;

  const DessertsState({
    this.desserts = const [],
    super.success = false,
    super.loading = false,
    super.error,
  });

  @override
  DessertsState copyWith({
    List<Dessert>? desserts,
    bool? success,
    bool? loading,
    Failure? error,
  }) {
    return DessertsState(
      desserts: desserts ?? this.desserts,
      success: success ?? this.success,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        desserts,
        success,
        loading,
        error,
      ];
}
