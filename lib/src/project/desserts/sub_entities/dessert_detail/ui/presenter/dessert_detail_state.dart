part of 'dessert_detail_presenter.dart';

final class DessertDetailState extends PresenterState {
  final String id;
  final Dessert dessert;

  DessertDetail? get dessertDetail {
    return dessert is DessertDetail ? dessert as DessertDetail : null;
  }

  const DessertDetailState({
    required this.id,
    required this.dessert,
    super.success = false,
    super.loading = false,
    super.error,
  });

  @override
  DessertDetailState copyWith({
    DessertDetail? dessert,
    bool? success,
    bool? loading,
    Failure? error,
  }) {
    return DessertDetailState(
      id: id,
      dessert: dessert ?? this.dessert,
      success: success ?? this.success,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        id,
        dessert,
        success,
        loading,
        error,
      ];
}
