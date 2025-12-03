import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';
import '../../../view_model/register_cubit.dart';
import '../../../view_model/register_states.dart';

class SendCodeButton extends StatelessWidget {
  const SendCodeButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit , RegisterStates>(
      builder: (context,state){
        var registerCubit = context.read<RegisterCubit>();
        return CustomButton(
            onPressed: registerCubit.isDataValid && registerCubit.isButtonEnabled
                ? () {
              if (formKey.currentState?.validate() == true) {
                registerCubit.changeStepperIndex(3);
              } else {
                registerCubit.disableButton();
              }
            }
            : null,
          text: LangKeys.sendCode.tr(),
        );

      },
    );
  }
}
