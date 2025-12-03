import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
import 'package:easy_deal/features/register/presentation/views/widgets/account_type_widgets/account_type_body.dart';
import 'package:easy_deal/features/register/presentation/views/widgets/client_info_widgets/client_info_body.dart';
 import 'package:easy_deal/features/register/presentation/views/widgets/custom_stepper.dart';
import 'package:easy_deal/features/register/presentation/views/widgets/gender_widgets/gender_body.dart';
 import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.signUp.tr()),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset(SvgImages.arrow),
        ),
      ),
      body:  Padding(
        padding:   EdgeInsets.all(20.0.r),
        child: BlocBuilder<RegisterCubit , RegisterStates>(
          builder: (context,state){
            var registerCubit = context.read<RegisterCubit>();
            return Column(
              children: [
                CustomStepper(),
                Gap(18.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: registerCubit.activeStep == 0
                        ? AccountTypeBody()
                        : registerCubit.activeStep == 1
                        ? GenderBody()
                        : ClientInfoBody(),
                  ),
                ),
                // if(registerCubit.activeStep==0)
                //   AccountTypeBody(),
                // if(registerCubit.activeStep==1)
                //   GenderBody(),
                // if(registerCubit.activeStep==2)
                //   ClientInfoBody(),
              ],
            );
          },

        ),
      ),
    );
  }
}
