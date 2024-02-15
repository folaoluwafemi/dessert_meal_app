import 'package:dessert_meal_app/src/entities/app/app_barrel.dart';
import 'package:dessert_meal_app/src/entities/desserts/dessert_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vanilla_state/vanilla_state.dart';

part 'setup.dart';

class DessertMealApp extends StatelessWidget {
  const DessertMealApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _AppSetup(
      child: MaterialApp.router(
        routerConfig: AppRouter.config,
        builder: (context, child) => ScreenUtilInit(
          designSize: const Size(390, 844),
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: Theme(
              data: AppTheme.light,
              child: child!,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
