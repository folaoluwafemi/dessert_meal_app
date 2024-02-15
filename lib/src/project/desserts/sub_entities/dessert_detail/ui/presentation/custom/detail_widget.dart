part of '../desserts_detail_screen.dart';

class DetailWidget extends StatelessWidget {
  final DessertDetail dessertDetail;

  const DetailWidget({
    Key? key,
    required this.dessertDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: MultiSliver(
        children: [
          22.boxHeight,
          Text(
            'Instructions',
            style: context.titleSmall,
          ),
          10.boxHeight,
          Text(
            dessertDetail.instructions ?? '',
            style: context.bodySmall.copyWith(
              color: context.textBlack,
            ),
          ),
          24.boxHeight,
          Text(
            'Ingredients',
            style: context.titleSmall,
          ),
          10.boxHeight,
          ...dessertDetail.ingredients.map(
            (e) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    e.ingredient,
                    style: context.bodySmall.copyWith(
                      color: context.textBlack,
                    ),
                  ),
                ),
                Text(
                  e.measure,
                  style: context.bodySmall.copyWith(
                    color: context.textBlack,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
