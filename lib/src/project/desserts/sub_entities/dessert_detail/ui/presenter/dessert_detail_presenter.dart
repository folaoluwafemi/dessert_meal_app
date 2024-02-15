import 'package:dessert_meal_app/src/project/desserts/dessert_barrel.dart';
import 'package:dessert_meal_app/src/tools/tools_barrel.dart';

part 'dessert_detail_state.dart';

final class DessertDetailPresenter extends Presenter<DessertDetailState> {
  final DessertsSource _source;

  DessertDetailPresenter(
    String id, {
    required Dessert dessert,
    DessertsSource? source,
  })  : _source = source ?? NetworkDessertSource(),
        super(DessertDetailState(id: id, dessert: dessert));

  Future<void> fetchDetail() => handleError(
        _fetchDetail(),
        catcher: notifyOnError,
      );

  Future<void> _fetchDetail() async {
    notifyLoading();
    final DessertDetail dessertDetail = await _source.fetchDessertDetail(
      state.id,
    );
    notifySuccess(
      state: state.copyWith(dessert: dessertDetail),
    );
  }

  Future<void> refresh() => fetchDetail();
}
