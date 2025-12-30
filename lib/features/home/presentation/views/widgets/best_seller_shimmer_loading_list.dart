import '../../../../../main_imports.dart';

class BestSellerShimmerLoadingList extends StatelessWidget {
  const BestSellerShimmerLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 260.w,
            height : 240.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Gap(12.w),
    );
  }
}
