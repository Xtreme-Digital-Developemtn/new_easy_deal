import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';
import '../../view_model/create_request_cubit.dart';
import '../../view_model/create_request_states.dart';

class PastButton extends StatelessWidget {
  const PastButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit , CreateRequestStates>(
      builder: (context,state){
        var createRequestCubit = context.read<CreateRequestCubit>();
        return CustomButton(
          onPressed: (){
            if(createRequestCubit.currentStepNumber>0){
              createRequestCubit.moveNextStep(createRequestCubit.currentStepNumber-1);
            }

          },
          text: LangKeys.past.tr(),
        );
      },

    );
  }
}
