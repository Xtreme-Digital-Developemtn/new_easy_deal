import '../../../../../main_imports.dart';

class LatestArticlesItem extends StatelessWidget {
  const LatestArticlesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.w,
      height: 300.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [

          /// IMAGE
          CustomNetWorkImage(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            imageUrl:
            "https://assets-news.housing.com/news/wp-content/uploads/2022/03/28143140/Difference-between-flat-and-apartment.jpg",
            raduis: 0,
          ),

          /// GRADIENT OVERLAY
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.65),
                    Colors.black.withValues(alpha: 0.25),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          /// TEXT CONTENT
          Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "22 Feb, 2025",
                  style: AppStyles.white14SemiBold,
                ),
                Gap(6.h),
                Text(
                  "#1 Sell Your House Today",
                  style: AppStyles.white16SemiBold,
                ),
                Gap(10.h),
                Text(
                  "Nation yet I century way of the into he gone day time. "
                      "And installer Explore some of the best tips from around "
                      "the world from our partners.",
                  style: AppStyles.white12Medium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
