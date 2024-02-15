import 'package:dessert_meal_app/src/project/app/app_barrel.dart';
import 'package:dessert_meal_app/src/tools/tools_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigateToNext() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    if (!mounted) return;
    context.goNamed(AppRoute.desserts.name);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    navigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 622.09.w,
            height: 932.h,
            child: Image.asset(
              Assets.backgroundImage,
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(22.w, 188.h, 22.w, 0),
            child: Text(
              'Dessert Meal \nApp',
              style: context.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
