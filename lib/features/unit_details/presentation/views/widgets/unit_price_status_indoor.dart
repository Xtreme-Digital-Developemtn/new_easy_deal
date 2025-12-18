import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class UnitPriceStatusIndoor extends StatelessWidget {
  const UnitPriceStatusIndoor({super.key, required this.price, required this.type, required this.status});
  final String? price;
  final String? type;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(price ?? "6000000.00 ${LangKeys.egp.tr()}",style: AppStyles.green20ExtraBold,),
        Gap(12.h),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: Color.fromRGBO(171, 227, 255, 0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height:4.h,
                    width: 4.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(44, 161, 241, 1),
                    ),
                  ),
                  Gap(4.w),
                  Text(type ?? "Compound",style: AppStyles.white12Medium.copyWith(
                    color: Color.fromRGBO(44, 161, 241, 1),
                  ),),
                ],
              ),
            ),
            Gap(12.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: AppColors.greenDark,
              ),
              child: Text(status ?? LangKeys.available.tr(),style: AppStyles.white12Medium,),
            ),
          ],
        ),
      ],
    );
  }
}
