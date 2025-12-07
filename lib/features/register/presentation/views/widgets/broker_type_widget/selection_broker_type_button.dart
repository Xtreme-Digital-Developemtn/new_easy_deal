
import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';

class SelectionBrokerTypeButton extends StatelessWidget {
  const SelectionBrokerTypeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit , RegisterStates>(
      builder: (context,state){
        var registerCubit = context.read<RegisterCubit>();
        return CustomButton(
          onPressed:registerCubit.selectBrokerIndex==0 ? null : (){
            registerCubit.changeStepperIndex(2);
          },
          text: LangKeys.next.tr(),
        );
      },

    );
  }
}
