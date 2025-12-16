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
                            ? () => registerCubit.changeStepperIndex(4)
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
                  if(state is SignUpSuccess){
                    Toast.showSuccessToast(msg: state.registerModel.message.toString(), context: context);
                    context.pushNamed(
                      Routes.otpView,
                      arguments: {
                        "isMobile": true,
                        "contact": registerCubit.phoneNumber,
                        "selectIndex": registerCubit.selectBrokerIndex,
                      },
                    );
                  }
                  else if (state is SignUpError){
                    Toast.showErrorToast(msg: state.message.toString(), context: context);
                  }
                } ,
                builder: (context,state){
                 return   ConditionalBuilder(
                   condition: state is ! SignUpLoading,
                   fallback: (context)=>CustomLoading(),
                  builder: (context){
                     return CustomButton(
                       onPressed: () {
                         if (formKey.currentState!.validate()) {
                           registerCubit.register(
                             fullName: registerCubit.nameCon.text,
                             phone: registerCubit.phoneCon.text,
                             password:registerCubit.passwordCon.text,
                             passwordConfirmation: registerCubit.confirmPasswordCon.text,
                             gender: registerCubit.gender.toString(),
                             email: registerCubit.emailCon.text,
                             image: null,
                           );

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
