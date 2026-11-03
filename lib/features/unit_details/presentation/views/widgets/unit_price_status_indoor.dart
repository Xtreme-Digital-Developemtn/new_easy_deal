import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class UnitPriceStatusIndoor extends StatelessWidget {
  const UnitPriceStatusIndoor({
    super.key,
    required this.price,
    required this.type,
    required this.status,
    this.rawStatus,
  });
  final String? price;
  final String? type;
  final String? status;

  /// قيمة الحالة كما جاءت من الـ API (sold / rented / reserved / available)،
  /// تستخدم للون الشارة فقط.
  final String? rawStatus;

  Color _statusColor() {
    switch (rawStatus?.toLowerCase().trim()) {
      case 'sold':
      case 'rented':
        return AppColors.errorDark;
      case 'reserved':
        return AppColors.grayDark;
      case 'available':
        return AppColors.greenDark;
      default:
        return AppColors.grayDark;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(price != null ? '$price ${LangKeys.egp.tr()}' : LangKeys.notAvailable.tr(),style: AppStyles.green20ExtraBold,),
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
                  Text(type ?? LangKeys.notAvailable.tr(),style: AppStyles.white12Medium.copyWith(
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
                color: _statusColor(),
              ),
              child: Text(
                status?.trim().isNotEmpty == true
                    ? status!
                    : LangKeys.notAvailable.tr(),
                style: AppStyles.white12Medium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
