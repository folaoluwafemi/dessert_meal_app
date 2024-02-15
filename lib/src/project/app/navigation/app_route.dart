part of 'app_router.dart';

enum AppRoute {
  splash('/'),
  desserts('/desserts'),
  dessertDetails('dessertsDetail/:id'),
  ;

  final String path;

  const AppRoute(this.path);
}
