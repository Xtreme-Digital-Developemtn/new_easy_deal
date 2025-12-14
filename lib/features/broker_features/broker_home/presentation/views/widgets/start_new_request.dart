import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';

class StartNewRequest extends StatelessWidget {
  const StartNewRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.pushNamed(Routes.createRequestView);
      },
      child: Container(
        padding: EdgeInsets.all(20.r),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.blueDark,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4.r),
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.gray1,
                  ),
                  child: SvgPicture.asset(SvgImages.search),
                ),
                Gap(12.w),
                Text(
                  LangKeys.startNewRequest.tr(),
                  style: AppStyles.white16SemiBold,
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                SvgImages.arrowLeft,
                colorFilter: ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
