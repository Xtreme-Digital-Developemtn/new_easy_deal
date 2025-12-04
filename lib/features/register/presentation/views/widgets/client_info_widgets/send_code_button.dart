import 'package:easy_localization/easy_localization.dart';
import '../../../../../../main_imports.dart';
import '../../../view_model/register_cubit.dart';
import '../../../view_model/register_states.dart';

class SendCodeButton extends StatelessWidget {
  const SendCodeButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      builder: (context, state) {
        final registerCubit = context.read<RegisterCubit>();
        final isEnabled = registerCubit.isButtonEnabled;
        return Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed:  (){
                  registerCubit.changeStepperIndex(1);
                },
                text: LangKeys.past.tr(),
              ),
            ),
            Gap(12.w),
            Expanded(
              child: CustomButton(
                onPressed: isEnabled
                    ? () {
                  if (formKey.currentState?.validate() == true) {
                    if (registerCubit.validateAllFields()) {
                      registerCubit.changeStepperIndex(3);
                      context.pushNamed(Routes.otpView);
                      //print("✅ تم الانتقال للخطوة التالية - كل البيانات صحيحة");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(LangKeys.pleaseCompleteTheRightData.tr()),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                     // print("⚠️ هناك خطأ في البيانات رغم أن الفورم صالح");
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(LangKeys.pleaseCompleteTheRightData.tr()),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                    //print("❌ الفورم غير صالح - يرجى تصحيح الأخطاء");
                  }
                }
                    : null,
                text: LangKeys.next.tr(),
              ),
            ),
          ],
        );
      },
    );
  }
}