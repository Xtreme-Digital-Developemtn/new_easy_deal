import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class CreatePasswordButtons extends StatelessWidget {
  const CreatePasswordButtons({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      builder: (context, state) {
        var registerCubit = context.read<RegisterCubit>();
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () => registerCubit.changeStepperIndex(2),
                    text: LangKeys.past.tr(),
                  ),
                ),
                Gap(12.w),
                Expanded(
                  child: ValueListenableBuilder<bool>(
                    valueListenable: registerCubit.isFormValid,
                    builder: (context, isValid, child) =>CustomButton(
                      onPressed: isValid
                          ? () => registerCubit.changeStepperIndex(4)
                          : null,
                      text: LangKeys.next.tr(),
                    ),
                  ),
                ),
              ],
            ),
            Gap(12.h),
            if (registerCubit.activeStep == 4)
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.pushNamed(
                      Routes.otpView,
                      arguments: {
                        "isMobile": true,
                        "contact": registerCubit.phoneNumber,
                      },
                    );
                  }
                },
                text: LangKeys.sendCode.tr(),
              ),
          ],
        );
      },
    );
  }
}
