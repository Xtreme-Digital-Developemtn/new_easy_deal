import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class CreatePasswordButtons extends StatelessWidget {
  const CreatePasswordButtons({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      builder: (context, state) {
        var registerCubit = context.read<RegisterCubit>();
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () => registerCubit.changeStepperIndex(2),
                    text: LangKeys.past.tr(),
                  ),
                ),
                Gap(12.w),
                Expanded(
                  child: ValueListenableBuilder<bool>(
                    valueListenable: registerCubit.isFormValid,
                    builder: (_, isValid, __) {
                      return CustomButton(
                        onPressed: isValid
                            ? () {
                          registerCubit.changeStepperIndex(4);
                          print(registerCubit.phoneCon.text);
                          print(registerCubit.emailCon.text);
                          print(registerCubit.nameCon.text);
                          print(registerCubit.passwordCon.text);
                          print("wwwwwwwwwwwwwwwwwwwwwsssssssssssssssssdddddddd");
                        }
                            : null,
                        text: LangKeys.next.tr(),
                      );
                    },
                  ),
                ),

              ],
            ),
            Gap(12.h),
            if (registerCubit.activeStep == 4)
              BlocConsumer<RegisterCubit , RegisterStates>(
                listener:(context,state){
                  if(state is SendOtpSuccessState){
                    Toast.showSuccessToast(msg: state.sendOtpModel.message.toString(), context: context);
                    context.pushNamed(
                      Routes.otpView,
                      arguments: {
                        "isMobile": true,
                        "contact": registerCubit.phoneNumber,
                        "selectIndex": registerCubit.selectBrokerIndex,
                        "gender": registerCubit.gender,
                        "role": registerCubit.role,
                        "name": registerCubit.nameCon.text,
                        "email": registerCubit.emailCon.text,
                        "password": registerCubit.passwordCon.text,
                        "confirmPassword": registerCubit.confirmPasswordCon.text,
                        "phone": registerCubit.phoneCon.text,

                      },
                    );
                  }
                  else if (state is SendOtpErrorState){
                    Toast.showErrorToast(msg: state.error.toString(), context: context);
                  }
                } ,
                builder: (context,state){
                 return   ConditionalBuilder(
                   condition: state is ! SendOtpLoadingState,
                   fallback: (context)=>CustomLoading(),
                  builder: (context){
                     return CustomButton(
                       onPressed: () {
                         if (formKey.currentState!.validate()) {
                           registerCubit.sendOtp(phone: registerCubit.phoneCon.text);
                           // registerCubit.register(
                           //   fullName: registerCubit.nameCon.text,
                           //   phone: registerCubit.phoneCon.text,
                           //   password:registerCubit.passwordCon.text,
                           //   passwordConfirmation: registerCubit.confirmPasswordCon.text,
                           //   gender: registerCubit.gender.toString(),
                           //   email: registerCubit.emailCon.text,
                           //   image: null,
                           // );

                         }
                       },
                       text: LangKeys.sendCode.tr(),
                     );
                  },
                 );
                } ,

              ),
          ],
        );
      },
    );
  }
}
