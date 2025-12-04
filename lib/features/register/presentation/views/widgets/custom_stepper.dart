
import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
 import 'package:easy_deal/main_imports.dart';
import 'package:easy_stepper/easy_stepper.dart';


class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: 12.w),
      child: BlocBuilder<RegisterCubit , RegisterStates>(
        builder: (context,state){
          var registerCubit = context.read<RegisterCubit>();
          final double screenWidth = MediaQuery.of(context).size.width;
          return  EasyStepper(
            activeStep: registerCubit.activeStep,
            direction: Axis.horizontal,
            alignment: Alignment.center,
            activeStepBorderColor: AppColors.white,
            finishedStepBackgroundColor: AppColors.primaryDark,
            finishedStepBorderColor: AppColors.primaryDark,
            activeStepBackgroundColor:  AppColors.primaryDark.withValues(alpha: 0.3),
            activeStepTextColor: AppColors.primaryDark,
            lineStyle:   LineStyle(
              lineType: LineType.dotted,
              lineThickness: 2.h,
              lineLength: screenWidth/4,
              activeLineColor: AppColors.primaryDark,
              finishedLineColor: AppColors.primaryDark,
              defaultLineColor: AppColors.gray,
            ),
            stepShape: StepShape.circle,
            defaultStepBorderType : BorderType.normal,
            stepRadius: 25.r,
            borderThickness: 2,
            showLoadingAnimation: false,
            enableStepTapping: false,
            steps: [
              EasyStep(
                customStep: registerCubit.activeStep > 0
                    ?   Icon(Icons.check, color: Colors.white, size: 18.sp)
                    : Text("01", style: AppStyles.white16SemiBold),
                customTitle: Center(
                  child: Text(
                    registerCubit.stepsNames[0],
                    style: AppStyles.black14Medium,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              EasyStep(
                customStep: registerCubit.activeStep > 1
                    ?   Icon(Icons.check, color: Colors.white, size: 18.sp)
                    : Text("02", style: AppStyles.white16SemiBold),
                customTitle: Center(
                  child: Text(
                    registerCubit.stepsNames[1],
                    style: AppStyles.black14Medium,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              EasyStep(
                customStep: registerCubit.activeStep > 2
                    ?   Icon(Icons.check, color: Colors.white, size: 18.sp)
                    : Text("03", style: AppStyles.white16SemiBold),
                customTitle: Center(
                  child: Text(
                    registerCubit.stepsNames[2],
                    style: AppStyles.black14Medium,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              EasyStep(
                customStep: registerCubit.activeStep > 3
                    ?   Icon(Icons.check, color: Colors.white, size: 18.sp)
                    : Text("04", style: AppStyles.white16SemiBold),
                customTitle: Center(
                  child: Text(
                    registerCubit.stepsNames[3],
                    style: AppStyles.black14Medium,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
            onStepReached: (index){
              registerCubit.changeStepperIndex(index);
            },
          );
        },
      ),
    );
  }
}