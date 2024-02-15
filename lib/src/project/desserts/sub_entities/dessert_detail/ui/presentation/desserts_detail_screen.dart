import 'package:dessert_meal_app/src/project/desserts/dessert_barrel.dart';
import 'package:dessert_meal_app/src/tools/tools_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:vanilla_state/vanilla_state.dart';

part 'custom/detail_widget.dart';

class DessertDetailScreen extends StatelessWidget {
  final String dessertID;
  final Dessert dessert;

  const DessertDetailScreen({
    Key? key,
    required this.dessertID,
    required this.dessert,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InheritedVanilla<DessertDetailPresenter>(
      createNotifier: () => DessertDetailPresenter(
        dessertID,
        dessert: dessert,
      )..fetchDetail(),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              leading: BackButton(
                color: context.textBlack,
              ),
              toolbarHeight: 54.h,
              title: Text(
                dessert.name ?? '',
                style: context.titleSmall.copyWith(
                  fontSize: 20.sp,
                  color: context.textBlack,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            body: CustomScrollView(
              slivers: [
                MultiSliver(
                  children: [
                    20.boxHeight,
                    Image.network(
                      dessert.imageUrl,
                      width: context.screenWidth,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      },
                      height: 265.h,
                      fit: BoxFit.cover,
                    ),
                    VanillaBuilder<DessertDetailPresenter, DessertDetailState>(
                      builder: (context, state) {
                        if (state.loading) {
                          return Padding(
                            padding: EdgeInsets.only(top: 100.h),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: context.primary,
                              ),
                            ),
                          );
                        }
                        if (state.dessertDetail == null) {
                          return const SizedBox();
                        }
                        return DetailWidget(
                          dessertDetail: state.dessertDetail!,
                        );
                      },
                    ),
                    100.boxHeight,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
