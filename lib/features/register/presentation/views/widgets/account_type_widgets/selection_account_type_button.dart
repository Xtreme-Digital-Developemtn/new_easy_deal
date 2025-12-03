
import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';

class SelectionAccountTypeButton extends StatelessWidget {
  const SelectionAccountTypeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit , RegisterStates>(
      builder: (context,state){
        var registerCubit = context.read<RegisterCubit>();
        return CustomButton(
          onPressed:registerCubit.selectTypeIndex==0 ? null : (){
            registerCubit.changeStepperIndex(1);
          },
          text: LangKeys.next.tr(),
        );
      },

    );
  }
}
