import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_imports.dart';

class UnitImageTypeLocation extends StatelessWidget {
  const UnitImageTypeLocation({super.key, this.image, this.apartment, this.city, this.area, this.subArea});
  final String? image;
  final String? apartment;
  final String? city;
  final String? area;
  final String? subArea;
  @override
  Widget build(BuildContext context) {
    return     Container(
    color: Colors.transparent,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          CustomNetWorkImage(
              width: double.infinity,
              height: 300.h,
              fit: BoxFit.cover,
              imageUrl:image ?? '',
              raduis: 12.r),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 90.h,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
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
          if (apartment != null)
            Positioned(
              bottom: 50.h,
              left:context.isArabic ? null : 16.w,
              right:context.isArabic ?  16.w : null,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.primaryDark,
                ),
                child: Text(apartment!,style: AppStyles.white12Medium,),
              ),
            ),
          Positioned(
            bottom: 25.h,
            left:context.isArabic ? null : 16.w,
            right:context.isArabic ?  16.w : null,
            child: Row(
              children: [
                Text(city ?? LangKeys.notAvailable.tr(),style: AppStyles.white14SemiBold,),
                Gap(4.w),
                SvgPicture.asset(SvgImages.verified),
              ],
            ),
          ),
          Positioned(
            bottom: 10.h,
            left:context.isArabic ? null : 16.w,
            right:context.isArabic ?  16.w : null,
            child: Row(
              children: [
                Text(area ?? LangKeys.notAvailable.tr(),style: AppStyles.white10Regular,),
                Gap(4.w),
                Text(subArea ?? LangKeys.notAvailable.tr(),style: AppStyles.white10Regular,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
