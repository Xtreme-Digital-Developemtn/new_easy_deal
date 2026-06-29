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
        return ValueListenableBuilder<bool>(
          valueListenable: registerCubit.isFormValid,
          builder: (context, isValid, child) => CustomButton(
            onPressed: isValid ? () {
              print(registerCubit.phoneCon.text);
              print(registerCubit.emailCon.text);
              print(registerCubit.nameCon.text);
              print(registerCubit.passwordCon.text);
              print("wwwwwwwwwwwwwwwwwwwwwsssssssssssssssssdddddddd");
              registerCubit.changeStepperIndex(3);
            } : null,
            text: LangKeys.next.tr(),
          ),
        );
      },
    );
  }
}