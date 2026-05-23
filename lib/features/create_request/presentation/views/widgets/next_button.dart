import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
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
        final isLoading = state is CreateRequestLoadingState;
        return ConditionalBuilder(
          condition: !isLoading,
          fallback: (context)=>CustomLoading(),
          builder: (context){
            return CustomButton(
              onPressed: (){
                if (createRequestCubit.currentStepNumber == 1) {
                  createRequestCubit.handleStepOne(context);
                } else {
                  createRequestCubit.handleNextSteps(context);
                }
              },
              text: createRequestCubit.currentStepNumber < createRequestCubit.totalSteps
                  ? LangKeys.next.tr()
                  : LangKeys.save.tr(),
            );
          },
        );
      },
    );
  }
}
