part of 'dessert_meal_app.dart';

class _AppSetup extends StatelessWidget {
  final Widget child;

  const _AppSetup({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InheritedVanilla<DessertsPresenter>(
      createNotifier: () => DessertsPresenter(),
      child: child,
    );
  }
}
