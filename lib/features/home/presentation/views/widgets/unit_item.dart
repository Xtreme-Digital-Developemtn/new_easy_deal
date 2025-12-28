 import 'package:easy_deal/features/search/data/models/all_units_model.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class UnitItem extends StatelessWidget {
  const UnitItem({super.key, this.unit, });
  final Data? unit;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.pushNamed(Routes.unitDetailsView,arguments: {
          "unitId" : unit!.id,
        });
      },
      child: Container(
        width: 260.w,
        height : 240.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.gray1
        ),
        child: Column(
          children: [
            Stack(
              alignment: context.isArabic
                  ? Alignment.topRight
                  : Alignment.topLeft,
              children: [
                ClipRRect(
                    borderRadius: BorderRadiusGeometry.only(topLeft: Radius.circular(12.r),topRight: Radius.circular(12.r)),
                    child: CustomNetWorkImage(
                        width: double.infinity,
                        height: 190.h,
                        fit: BoxFit.cover,
                        imageUrl:unit?.diagram?? "https://media.istockphoto.com/id/1499019570/photo/roof-garden.jpg?s=1024x1024&w=is&k=20&c=6fNpGPOAcQ8xDZ5BmvkShZekQ-nomhgZZaMs5dXxZ5c=",
                        raduis: 0)),
               Positioned(
                 top: 16.h,
                 left: context.isArabic ? null : 16.w,
                 right: context.isArabic ? 16.w : null,
                 child: Row(
                   children: [
                     Container(
                       padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.h),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12.r),
                         color: AppColors.white,
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           SvgPicture.asset(SvgImages.star,height: 8.h,),
                           Gap(6.w),
                           Text(unit?.type??"Feature 1",style: AppStyles.gray8Medium,),
                         ],
                       ),
                     ),
                     Gap(8.w),
                     Container(
                       padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.h),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12.r),
                         color: AppColors.white,
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           SvgPicture.asset(SvgImages.money,height: 8.h,),
                           Gap(6.w),
                           Text(unit?.pricePerMeterInCash??"2150.50000",style: AppStyles.gray8Medium,),
                         ],
                       ),
                     ),
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
                Positioned(
                  bottom: 50.h,
                  left: context.isArabic ? null : 16.w,
                  right: context.isArabic ? 16.w : null,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.primaryDark,
                    ),
                    child: Text(unit?.status ?? "Apartment",style: AppStyles.white12Medium,),
                  ),
                ),
                Positioned(
                  bottom: 25.h,
                  left: context.isArabic ? null : 16.w,
                  right: context.isArabic ? 16.w : null,
                  child: Row(
                    children: [
                      Text(context.isArabic ? unit?.city?.nameAr??"Marasem, New Cairo": unit?.city?.nameEn??"Marasem, New Cairo",style: AppStyles.white14SemiBold,),
                      Gap(4.w),
                      SvgPicture.asset(SvgImages.verified),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  left: context.isArabic ? null : 16.w,
                  right: context.isArabic ? 16.w : null,
                  child: Row(
                    children: [
                      Text(context.isArabic ? unit?.area?.nameAr ?? "Marasem, New Cairo" : unit?.area?.nameEn ?? "Marasem, New Cairo",style: AppStyles.white10Regular,),
                      Gap(4.w),
                      Text(context.isArabic ? unit?.subArea?.nameAr ?? "Marasem, New Cairo":unit?.subArea?.nameEn ?? "Marasem, New Cairo",style: AppStyles.white10Regular,),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding:   EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: List.generate(5, (index){
                            return SvgPicture.asset(SvgImages.star,height: 10.h,);
                          }),
                        ),
                        Gap(6.w),
                        Text("5.0",style: AppStyles.gray12Medium,),
                        Gap(6.w),
                        Text("(107 ${LangKeys.reviews.tr()})",style: AppStyles.gray12Medium,),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(SvgImages.compare,height: 24.h,width: 24.w,),
                        Gap(12.w),
                        SvgPicture.asset(SvgImages.fav,height: 24.h,width: 24.w,),


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
