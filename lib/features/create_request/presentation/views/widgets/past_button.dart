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
        return GestureDetector(
          onTap: (){
            if(createRequestCubit.currentStepNumber>0){
              createRequestCubit.moveNextStep(createRequestCubit.currentStepNumber-1);
            }
          },
          child: Container(
            width: 80.h,
            height: 50.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryDark.withValues(alpha: 0.35), width: 1.5),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_rounded,
                color: AppColors.primaryDark,
                size: 28.sp,
              ),
            ),
          ),
        );
      },
    );
  }
}
