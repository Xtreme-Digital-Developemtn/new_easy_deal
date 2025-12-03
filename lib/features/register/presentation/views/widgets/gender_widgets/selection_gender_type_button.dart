
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';
import '../../../view_model/register_cubit.dart';
import '../../../view_model/register_states.dart';

class SelectionGenderTypeButton extends StatelessWidget {
  const SelectionGenderTypeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit , RegisterStates>(
      builder: (context,state){
        var registerCubit = context.read<RegisterCubit>();
        return CustomButton(
          onPressed:registerCubit.selectGenderIndex==0 ? null : (){
            registerCubit.changeStepperIndex(2);
          },
          text: LangKeys.next.tr(),
        );
      },

    );
  }
}
