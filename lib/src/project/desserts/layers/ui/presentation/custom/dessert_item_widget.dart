part of '../desserts_screen.dart';

class DessertItemWidget extends StatelessWidget {
  final Dessert dessert;

  const DessertItemWidget({
    required this.dessert,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: () {
        context.goNamed(
          AppRoute.dessertDetails.name,
          pathParameters: {'id': dessert.id},
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SizedBox(
              width: 398.w,
              height: 245.h,
              child: Image.network(
                dessert.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          8.boxHeight,
          Text(
            dessert.name,
            style: context.bodyMedium,
          ),
        ],
      ),
    );
  }
}
