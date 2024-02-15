import 'package:dessert_meal_app/src/project/app/app_barrel.dart';
import 'package:dessert_meal_app/src/project/desserts/dessert_barrel.dart';
import 'package:dessert_meal_app/src/tools/tools_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vanilla_state/vanilla_state.dart';

part 'custom/dessert_item_widget.dart';

class DessertsScreen extends StatefulWidget {
  const DessertsScreen({Key? key}) : super(key: key);

  @override
  State<DessertsScreen> createState() => _DessertsScreenState();
}

class _DessertsScreenState extends State<DessertsScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DessertsPresenter>().fetchDesserts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return VanillaBuilder<DessertsPresenter, DessertsState>(
      builder: (_, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(toolbarHeight: 0),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    24.boxHeight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Desserts',
                          style: context.titleMedium.copyWith(
                            color: context.primary,
                          ),
                        ),
                        SvgPicture.asset(
                          VectorAssets.menu,
                        ),
                      ],
                    ),
                    30.boxHeight,
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context.read<DessertsPresenter>().fetchDesserts();
                        },
                        child: ListView.separated(
                          separatorBuilder: (context, index) => 24.boxHeight,
                          itemCount: state.desserts.length,
                          itemBuilder: (context, index) {
                            final Dessert dessert = state.desserts[index];
                            return DessertItemWidget(
                              dessert: dessert,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (state.loading) ...[
              const LoaderWidget(),
            ],
          ],
        );
      },
    );
  }
}
