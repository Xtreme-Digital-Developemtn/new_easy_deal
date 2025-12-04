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
        return CustomButton(
          onPressed: isEnabled
              ? () {
            if (formKey.currentState?.validate() == true) {
              if (registerCubit.validateAllFields()) {
                registerCubit.changeStepperIndex(3);
                //print("✅ تم الانتقال للخطوة التالية - كل البيانات صحيحة");
              } else {
               // print("⚠️ هناك خطأ في البيانات رغم أن الفورم صالح");
              }
            } else {
              //print("❌ الفورم غير صالح - يرجى تصحيح الأخطاء");
            }
          }
              : null,
          text: LangKeys.sendCode.tr(),
          color: isEnabled
              ? AppColors.primaryDark
              : AppColors.gray.withValues(alpha: 0.5),
        );
      },
    );
  }
}