import 'package:dessert_meal_app/src/project/app/app_barrel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigateToNext() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    if (!mounted) return;
    context.goNamed(AppRoute.desserts.name);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // navigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Placeholder(),
    );
  }
}
