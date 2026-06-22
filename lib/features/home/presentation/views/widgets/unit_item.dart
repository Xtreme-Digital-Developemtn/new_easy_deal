import 'package:easy_deal/features/home/data/models/best_seller_units_model.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class UnitItem extends StatelessWidget {
  const UnitItem({super.key, this.unit});

  final Data? unit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.unitDetailsView,
          arguments: {"unitId": unit!.id.toString()},
        );
      },
      child: Container(
        width: 260.w,
        height: 240.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.gray1,
        ),
        child: Column(
          children: [
            Stack(
              alignment: context.isArabic
                  ? Alignment.topRight
                  : Alignment.topLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                  child: CustomNetWorkImage(
                    width: double.infinity,
                    height: 190.h,
                    fit: BoxFit.cover,
                    imageUrl: unit?.diagram?.toString() ?? '',
                    raduis: 0,
                  ),
                ),
                if (unit?.type != null || unit?.totalPriceInCash != null)
                  Positioned(
                    top: 16.h,
                    left: context.isArabic ? null : 16.w,
                    right: context.isArabic ? 16.w : null,
                    child: Row(
                      children: [
                        if (unit?.type != null)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(SvgImages.star, height: 8.h),
                                Gap(6.w),
                                Text(
                                  unit!.type!,
                                  style: AppStyles.gray8Medium,
                                ),
                              ],
                            ),
                          ),
                        if (unit?.totalPriceInCash != null) ...[
                          Gap(8.w),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(SvgImages.money, height: 8.h),
                                Gap(6.w),
                                Text(
                                  '${unit!.totalPriceInCash} ${LangKeys.egp.tr()}',
                                  style: AppStyles.gray8Medium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 90.h,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.55),
                          Colors.black.withValues(alpha: 0.25),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                if (unit?.deliveryStatus != null)
                  Positioned(
                    bottom: 50.h,
                    left: context.isArabic ? null : 16.w,
                    right: context.isArabic ? 16.w : null,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.primaryDark,
                      ),
                      child: Text(
                        unit!.deliveryStatus!,
                        style: AppStyles.white12Medium,
                      ),
                    ),
                  ),
                if (unit?.city != null || unit?.area != null || unit?.subArea != null)
                  Positioned(
                    bottom: 25.h,
                    left: context.isArabic ? null : 16.w,
                    right: context.isArabic ? 16.w : null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (unit?.city != null)
                          Text(
                            context.isArabic
                                ? unit!.city!.nameAr ?? LangKeys.notAvailable.tr()
                                : unit!.city!.nameEn ?? LangKeys.notAvailable.tr(),
                            style: AppStyles.white14SemiBold,
                          ),
                        if (unit?.area != null || unit?.subArea != null)
                          Row(
                            children: [
                              if (unit?.area != null)
                                Text(
                                  context.isArabic
                                      ? unit!.area!.nameAr ?? LangKeys.notAvailable.tr()
                                      : unit!.area!.nameEn ?? LangKeys.notAvailable.tr(),
                                  style: AppStyles.white10Regular,
                                ),
                              if (unit?.area != null && unit?.subArea != null)
                                Gap(4.w),
                              if (unit?.subArea != null)
                                Text(
                                  context.isArabic
                                      ? unit!.subArea!.nameAr ?? LangKeys.notAvailable.tr()
                                      : unit!.subArea!.nameEn ?? LangKeys.notAvailable.tr(),
                                  style: AppStyles.white10Regular,
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return SvgPicture.asset(
                              SvgImages.star,
                              height: 10.h,
                            );
                          }),
                        ),
                        Gap(6.w),
                        Text("5.0", style: AppStyles.gray12Medium),
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
