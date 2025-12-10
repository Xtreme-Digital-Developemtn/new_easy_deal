import 'package:easy_localization/easy_localization.dart';
import '../../../../../../main_imports.dart';
import '../../../view_model/register_cubit.dart';
import '../../../view_model/register_states.dart';

class ClientInfoButtons extends StatelessWidget {
  const ClientInfoButtons({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      builder: (context, state) {
        final registerCubit = context.read<RegisterCubit>();
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
              child: ValueListenableBuilder<bool>(
                valueListenable: registerCubit.isFormValid,
                builder: (context, isValid, child) => CustomButton(
                  onPressed: isValid ? () {
                    registerCubit.changeStepperIndex(3);
                  } : null,
                  text: LangKeys.next.tr(),
                ),
              ),
            ),

          ],
        );
      },
    );
  }
}