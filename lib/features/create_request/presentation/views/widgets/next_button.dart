import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit , CreateRequestStates>(
      builder: (context,state){
        var createRequestCubit = context.read<CreateRequestCubit>();
        return CustomButton(
          onPressed: (){
            if(createRequestCubit.currentStepNumber<6){
              createRequestCubit.moveNextStep(createRequestCubit.currentStepNumber+1);
            }

          },
          text: LangKeys.next.tr(),
        );
      },

    );
  }
}
