import 'package:easy_deal/main_imports.dart';

import '../../view_model/home_cubit.dart';

class SiteItem extends StatelessWidget {
  const SiteItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Stack(
          children: [
            /// Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                cubit.locationsImages[index],
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            /// Gradient
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withValues(alpha: .65),
                      Colors.black.withValues(alpha: .25),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            /// Bottom Content
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      SvgImages.location,
                      height: 16.h,
                      width: 16.w,
                    ),
                    Gap(6.w),
                    Flexible(
                      child: Text(
                        cubit.locationsTitles[index],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.white14SemiBold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}