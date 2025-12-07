import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/core/shared_widgets/general_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_imports.dart';
import '../../view_model/otp_cubit.dart';
import '../../view_model/otp_states.dart';

class VerifyOtpButton extends StatelessWidget {
  final TextEditingController controller;
  final bool isMobile;
  const VerifyOtpButton({super.key, required this.controller, required this.isMobile,   });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpStates>(
      listener: (context, state) {
        // if (state is VerifyOtpSuccessState) {
        //   if(state.verifyOtpModel.data!.name!=" " || state.verifyOtpModel.data!.firstName!="" || state.verifyOtpModel.data!.lastName!="" || state.verifyOtpModel.data!.email!=""){
        //     AppNav.customNavigator(
        //       context: context,
        //       screen:  const LayoutView() ,
        //       finish:false,
        //     );
        //     context.read<AuthCubit>().loginWithToken(CacheTokenManger.userToken.toString());
        //   }else{
        //     AppNav.customNavigator(
        //       context: context,
        //       screen:  const RegisterView() ,
        //       finish:false,
        //     );
        //   }
        //
        //   NewToast.showNewSuccessToast(
        //     msg: state.verifyOtpModel.message.toString(),
        //     context: context,
        //   );
        // }
        // if (state is VerifyOtpErrorState) {
        //   NewToast.showNewErrorToast(
        //     msg: state.error.toString(),
        //     context: context,
        //   );
        // }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! VerifyOtpLoadingState,
          fallback: (context) => const CustomLoading(),
          builder: (context) {
            return CustomButton(
              text:context.tr(LangKeys.verifyCode),
              onPressed: () {
                if (controller.text.length == 4) {
                  // context.read<OtpCubit>().verifyOtp(
                  //   otpCode: controller.text,
                  //   phone: context.read<LoginCubit>().phoneNumber.toString(),
                  // );
                  ///
                  // GeneralBottomSheet.show(
                  //   heightRatio: 0.45,
                  //     context: context,
                  //     image: SvgPicture.asset(SvgImages.tickCircle,height: 100.h,width: 100.w,),
                  //     title:isMobile ? LangKeys.mobileNumberChangedSuccessfully.tr(): LangKeys.emailAddressChangedSuccessfully.tr(),
                  //     description: "",
                  //     buttonText: LangKeys.done.tr(),
                  //     onButtonPressed: (){
                  //     context.pushNamed(Routes.layoutView);
                  //     },
                  // );
                  ///
                  if(CacheHelper.getData(key: "role")=="client"){
                    context.pushNamedAndRemoveUntil(Routes.successView);
                  }else{
                    context.pushNamedAndRemoveUntil(Routes.uploadBrokerDocView);
                  }

                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(context.tr(LangKeys.pleaseEnterValidOtp,),),
                      backgroundColor: AppColors.errorLight,),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}