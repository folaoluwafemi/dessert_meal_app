import 'package:dessert_meal_app/src/tools/tools_barrel.dart';
import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Container(
        color: Colors.black.withOpacity(0.3),
        child: Center(
          child: CircularProgressIndicator(
            color: context.primary,
          ),
        ),
      ),
    );
  }
}
