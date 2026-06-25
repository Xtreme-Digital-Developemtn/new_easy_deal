import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/utils/toast/toast.dart';
import '../../../../../main_imports.dart';
import '../../../../register/presentation/view_model/register_states.dart';

class VerifyOtpButton extends StatelessWidget {
  final TextEditingController controller;
  final bool isMobile;
  final int selectIndex;
  final String  phone;
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String gender;
  final String role;
  final String phone2;
  const VerifyOtpButton({super.key, required this.controller, required this.isMobile, required this.selectIndex, required this.phone, required this.name, required this.email, required this.password, required this.confirmPassword, required this.gender, required this.role, required this.phone2,   });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
      if(state is VerifyOtpSuccessState){
        Toast.showSuccessToast(msg: state.verifyOtpModel.message.toString(), context: context);
        if (role == "broker") {
          context.pushNamed(Routes.uploadBrokerDocView,
            arguments: {
              "gender": gender,
              "role": role,
              "name": name,
              "email": email,
              "password": password,
              "confirmPassword": confirmPassword,
              "phone": phone2,
              "selectIndex": selectIndex,
            },
          );
        } else {
          context.pushNamed(Routes.successView,
            arguments: {
              "gender": gender,
              "role": role,
              "name": name,
              "email": email,
              "password": password,
              "confirmPassword": confirmPassword,
              "phone": phone2,
              "selectIndex": selectIndex,
            },
          );
        }
      }
      // else if (state is SignUpSuccess && state is VerifyOtpSuccessState&&CacheHelper.getData(key: "userRole")=="client"){
      //   Toast.showSuccessToast(msg: state.registerModel.message.toString(), context: context);
      //   context.pushNamedAndRemoveUntil(Routes.successView);
      // }
      else if (state is VerifyOtpErrorState){
        Toast.showErrorToast(msg: state.error, context: context);
      }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! VerifyOtpLoadingState,
          fallback: (context) => const CustomLoading(),
          builder: (context) {
            return ListenableBuilder(
              listenable: controller,
              builder: (context, _) {
                return CustomButton(
                  text: context.tr(LangKeys.verifyCode),
                  onPressed: controller.text.length == 6
                      ? () {
                          context.read<RegisterCubit>().verifyOtp(
                            otp: controller.text,
                            phone: phone,
                          );
                        }
                      : null,
                );
              },
            );
          },
        );
      },
    );
  }
}