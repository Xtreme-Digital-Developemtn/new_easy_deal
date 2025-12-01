import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';


class EditEmailView extends StatelessWidget {
  const EditEmailView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.editEmailAddress.tr()),
        leading: IconButton(onPressed: (){
          context.pop();
        }, icon: SvgPicture.asset(SvgImages.arrow)),
      ),
      body: Padding(
        padding:   EdgeInsets.all(20.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LangKeys.editEmailAddressMsg.tr()),
            Gap(32.h),
            Text(LangKeys.emailAddress.tr()),
            Gap(8.h),
            CustomTextFormField(),
            Gap(32.h),
            CustomButton(
              onPressed: (){},
              text: LangKeys.sendCode.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
