import 'package:dessert_meal_app/src/entities/desserts/dessert_barrel.dart';
import 'package:dessert_meal_app/src/tools/tools_barrel.dart';

part 'desserts_state.dart';

final class DessertsPresenter extends Presenter<DessertsState> {
  final DessertsSource _source;

  DessertsPresenter({
    DessertsSource? source,
  })  : _source = NetworkDessertSource(),
        super(const DessertsState());

  Future<void> fetchDesserts() => handleError(
        _fetchDesserts(),
        catcher: notifyOnError,
      );

  Future<void> _fetchDesserts() async {
    notifyLoading();
    final List<Dessert> desserts = await _source.fetchDesserts();
    notifySuccess(
      state: state.copyWith(desserts: desserts),
    );
  }

  Future<void> refresh() => fetchDesserts();
}
