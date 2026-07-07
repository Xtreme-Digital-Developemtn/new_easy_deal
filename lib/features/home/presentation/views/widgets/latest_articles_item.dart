import 'package:easy_deal/features/home/presentation/view_model/home_cubit.dart';
import '../../../../../main_imports.dart';

class LatestArticlesItem extends StatelessWidget {
  const LatestArticlesItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return SizedBox(
      width: 240.w,
      child: AspectRatio(
        aspectRatio: 4 / 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              /// IMAGE
              Image.asset(
                cubit.lastArticlesImages[index],
                fit: BoxFit.cover,
              ),

              /// GRADIENT
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: .70),
                        Colors.black.withValues(alpha: .30),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              /// CONTENT
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "#${index + 1} ${cubit.lastArticlesTitles[index]}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.white16SemiBold,
                      ),

                      Gap(8.h),

                      Text(
                        cubit.lastArticlesDescription[index],
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.white12Medium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}