import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
import 'package:easy_deal/features/register/presentation/views/widgets/account_type_widgets/account_type_body.dart';
import 'package:easy_deal/features/register/presentation/views/widgets/broker_type_widget/broker_type_body.dart';
import 'package:easy_deal/features/register/presentation/views/widgets/client_info_widgets/client_info_body.dart';
import 'package:easy_deal/features/register/presentation/views/widgets/gender_widgets/gender_body.dart';
import 'package:easy_deal/features/register/presentation/views/widgets/password_widgets/password_body.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.signUp),
      body: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: BlocBuilder<RegisterCubit, RegisterStates>(
          builder: (context, state) {
            var registerCubit = context.read<RegisterCubit>();
            return Column(
              children: [
                // CustomStepper(),
                // Gap(18.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: () {
                      switch (registerCubit.activeStep) {
                        case 0:
                          return AccountTypeBody();
                        case 1:
                          if (registerCubit.selectTypeIndex == 1) {
                            return GenderBody();
                          } else if (registerCubit.selectTypeIndex == 2) {
                            return BrokerTypeBody();
                          }
                        case 2:
                          return ClientInfoBody();
                        case 3:
                          return PasswordBody();
                        case 4:
                          return PasswordBody();
                        default:
                          return AccountTypeBody();
                      }
                    }(),
                  ),
                ),
                Column(
                  children: [
                    Text(LangKeys.haveAnAccount.tr(),style: AppStyles.black16Medium,),
                    TextButton(onPressed: (){
                      context.pop();
                    } ,child: Text(LangKeys.signIn.tr(),style: AppStyles.primary16SemiBold,),),
                  ],
                ),
                Gap(MediaQuery.of(context).size.height*0.05),
              ],
            );
          },
        ),
      ),
    );
  }
}
