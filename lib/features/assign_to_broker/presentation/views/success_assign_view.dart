import 'package:easy_deal/features/layout/presentation/view_model/layout_cubit.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class SuccessAssignView extends StatelessWidget {
  const SuccessAssignView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding:   EdgeInsets.all(20.0.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox.shrink(),
            Column(
              children: [
                SvgPicture.asset(SvgImages.assignSuccess),
                Gap(24.h),
                Text(LangKeys.requestSentSuccessfully.tr(),style: AppStyles.black16SemiBold,),
              ],
            ),
            CustomButton(
              onPressed: (){
                context.read<LayoutCubit>().changeBottomNav(0, context);
                context.pushNamedAndRemoveUntil(Routes.layoutView);
              },
              text: LangKeys.backToHome.tr(),
            ),
          ],
        ),
      )),
    );
  }
}
