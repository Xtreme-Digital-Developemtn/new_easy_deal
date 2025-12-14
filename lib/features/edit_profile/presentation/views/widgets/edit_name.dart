import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class EditName extends StatelessWidget {
  const EditName({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(LangKeys.editName.tr(), style: AppStyles.black16SemiBold),
              InkWell(
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset(SvgImages.close),
              ),
            ],
          ),
          Gap(12.h),
          CustomTextFormField(hintText: LangKeys.enterYourName.tr()),
          Gap(12.h),
          CustomButton(onPressed: () {}, text: LangKeys.save.tr()),
          Gap(MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
