import 'package:dessert_meal_app/src/project/app/starter/splash/splash_screen.dart';
import 'package:dessert_meal_app/src/project/desserts/dessert_barrel.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'app_route.dart';

abstract final class AppRouter {
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static GoRouter get router => _router;

  static final RouterConfig<Object> config = RouterConfig(
    routerDelegate: router.routerDelegate,
    backButtonDispatcher: router.backButtonDispatcher,
    routeInformationParser: router.routeInformationParser,
    routeInformationProvider: router.routeInformationProvider,
  );
}

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: _navigatorKey,
  routes: [
    GoRoute(
      name: AppRoute.splash.name,
      path: AppRoute.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: AppRoute.desserts.name,
      path: AppRoute.desserts.path,
      builder: (context, state) => const DessertsScreen(),
      routes: [
        GoRoute(
          name: AppRoute.dessertDetails.name,
          path: AppRoute.dessertDetails.path,
          builder: (context, state) {
            return DessertDetailScreen(
              dessertID: state.pathParameters['id']!,
              dessert: state.extra as Dessert,
            );
          },
        ),
      ],
    ),
  ],
);
