import 'package:easy_deal/features/home/presentation/view_model/home_cubit.dart';
import '../../../../../main_imports.dart';

class LatestArticlesItem extends StatelessWidget {
  const LatestArticlesItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.w,
      height: 300.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          /// IMAGE
          // CustomNetWorkImage(
          //   width: double.infinity,
          //   height: double.infinity,
          //   fit: BoxFit.cover,
          //   imageUrl:
          //   "https://assets-news.housing.com/news/wp-content/uploads/2022/03/28143140/Difference-between-flat-and-apartment.jpg",
          //   raduis: 0,
          // ),
          Image.asset(
            context.read<HomeCubit>().lastArticlesImages[index],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
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
                Gap(6.h),
                Text(
                  "#${index + 1} ${context.read<HomeCubit>().lastArticlesTitles[index]}",
                  style: AppStyles.white16SemiBold,
                ),
                Gap(10.h),
                Text(
                  context.read<HomeCubit>().lastArticlesDescription[index],
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
