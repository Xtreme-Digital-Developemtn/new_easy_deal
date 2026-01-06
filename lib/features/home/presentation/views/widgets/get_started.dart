import 'package:easy_deal/features/home/presentation/views/widgets/services_bottom_sheet.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/shared_widgets/general_bottom_sheet.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.primaryDark,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LangKeys.readyToMakeAMove.tr(),
                    style: TextStyle(color: AppColors.white),
                  ),
                  Gap(4.h),
                  Text(
                    LangKeys.buySellOrRentYourPropertyToday.tr(),
                    style: TextStyle(color: AppColors.gray),
                  ),
                ],
              ),
            ),
            Gap(12.w),
            SizedBox(
              height: 40.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () {
                  StandardBottomSheet.show(
                    context: context,
                    isScrollControlled: true,
                    child: Builder(
                      builder: (sheetContext) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: 20.r,
                            left: 20.r,
                            right: 20.r,
                            bottom: MediaQuery.of(
                              sheetContext,
                            ).viewInsets.bottom,
                          ),
                          child: ServicesBottomSheet(),
                        );
                      },
                    ),
                  );
                },
                child: Text(
                  LangKeys.getStarted.tr(),
                  style: AppStyles.primary14Medium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
