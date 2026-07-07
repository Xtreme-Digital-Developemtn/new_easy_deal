import 'package:easy_deal/features/home/data/models/best_seller_units_model.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class UnitItem extends StatelessWidget {
  const UnitItem({
    super.key,
    this.unit,
  });

  final Data? unit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.unitDetailsView,
          arguments: {
            "unitId": unit?.id.toString(),
          },
        );
      },
      child: Container(
        width: 260.w,
        decoration: BoxDecoration(
          color: AppColors.gray1,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 10,
              child: Stack(
                children: [
                  /// Image
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                    child: CustomNetWorkImage(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: unit?.diagram ?? '',
                      raduis: 0,
                    ),
                  ),

                  /// Gradient
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
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

                  /// Top Badges
                  Align(
                    alignment: context.isArabic
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Wrap(
                        spacing: 8.w,
                        runSpacing: 8.h,
                        children: [
                          if (unit?.type != null)
                            _TopBadge(
                              icon: SvgImages.star,
                              text: unit!.type!,
                            ),
                          if (unit?.totalPriceInCash != null)
                            _TopBadge(
                              icon: SvgImages.money,
                              text:
                              "${unit!.totalPriceInCash} ${LangKeys.egp.tr()}",
                            ),
                        ],
                      ),
                    ),
                  ),

                  /// Bottom Info
                  Align(
                    alignment: context.isArabic
                        ? Alignment.bottomRight
                        : Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: context.isArabic
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          if (unit?.deliveryStatus != null)
                            Container(
                              margin: EdgeInsets.only(bottom: 8.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryDark,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Text(
                                unit!.deliveryStatus!,
                                style: AppStyles.white12Medium,
                              ),
                            ),

                          if (unit?.city != null)
                            Text(
                              context.isArabic
                                  ? unit!.city!.nameAr ??
                                  LangKeys.notAvailable.tr()
                                  : unit!.city!.nameEn ??
                                  LangKeys.notAvailable.tr(),
                              style: AppStyles.white14SemiBold,
                            ),

                          if (unit?.area != null || unit?.subArea != null)
                            Padding(
                              padding: EdgeInsets.only(top: 4.h),
                              child: Wrap(
                                spacing: 6.w,
                                children: [
                                  if (unit?.area != null)
                                    Text(
                                      context.isArabic
                                          ? unit!.area!.nameAr ??
                                          LangKeys.notAvailable.tr()
                                          : unit!.area!.nameEn ??
                                          LangKeys.notAvailable.tr(),
                                      style: AppStyles.white10Regular,
                                    ),
                                  if (unit?.subArea != null)
                                    Text(
                                      context.isArabic
                                          ? unit!.subArea!.nameAr ??
                                          LangKeys.notAvailable.tr()
                                          : unit!.subArea!.nameEn ??
                                          LangKeys.notAvailable.tr(),
                                      style: AppStyles.white10Regular,
                                    ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Bottom Actions
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: List.generate(
                            5,
                                (_) => Padding(
                              padding: EdgeInsets.only(right: 2.w),
                              child: SvgPicture.asset(
                                SvgImages.star,
                                height: 10.h,
                              ),
                            ),
                          ),
                        ),
                        Gap(6.w),
                        Text(
                          "5.0",
                          style: AppStyles.gray12Medium,
                        ),
                        Gap(6.w),
                        Text(
                          "(107 ${LangKeys.reviews.tr()})",
                          style: AppStyles.gray12Medium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          SvgImages.compare,
                          height: 24.h,
                          width: 24.w,
                        ),
                        Gap(12.w),
                        SvgPicture.asset(
                          SvgImages.fav,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ],
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

class _TopBadge extends StatelessWidget {
  const _TopBadge({
    required this.icon,
    required this.text,
  });

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            height: 10.h,
          ),
          Gap(6.w),
          Text(
            text,
            style: AppStyles.gray8Medium,
          ),
        ],
      ),
    );
  }
}