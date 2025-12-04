import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.success.tr()),
      ),
      body: Padding(
        padding:   EdgeInsets.all(20.0.r),
        child: Column(
          children: [
            Image.asset(PngImages.success,height: 300.h,width: 300.w,fit: BoxFit.cover,),
            Gap(12.h),
            Text(LangKeys.registerSuccessMsg.tr(),textAlign: TextAlign.center,
            style: AppStyles.black16SemiBold,),
            Spacer(),
            CustomButton(
              text: LangKeys.start.tr(),
              onPressed: (){
                context.pushNamed(Routes.layoutView);
              },
            ),
            Gap(12.h),

          ],
        ),
      ),
    );
  }
}
