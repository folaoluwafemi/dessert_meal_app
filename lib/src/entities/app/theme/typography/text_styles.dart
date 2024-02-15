import 'package:dessert_meal_app/src/entities/app/app_barrel.dart';
import 'package:dessert_meal_app/src/tools/tools_barrel.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class TextStyles {
  static final TextStyle titleLarge = TextStyle(
    height: 0.8,
    fontSize: 64.sp,
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
    fontFamily: FontAssets.darkerGrotesk,
  );

  static final TextStyle titleMedium = TextStyle(
    height: 0.8,
    fontSize: 32.sp,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w500,
    fontFamily: FontAssets.spaceGrotesk,
  );

  static final TextStyle titleSmall = TextStyle(
    height: 1.1667,
    fontSize: 24.sp,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w500,
    fontFamily: FontAssets.spaceGrotesk,
  );

  static final TextStyle bodyMedium = TextStyle(
    height: 1,
    fontSize: 16.sp,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w500,
    fontFamily: FontAssets.inter,
  );

  static final TextStyle bodySmall = TextStyle(
    height: 1.5,
    fontSize: 16.sp,
    color: AppColors.textBlack,
    fontWeight: FontWeight.normal,
    fontFamily: FontAssets.inter,
  );
}
