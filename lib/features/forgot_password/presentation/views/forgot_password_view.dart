import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/core/shared_widgets/phone_widget.dart';
import 'package:easy_deal/features/otp/presentation/views/widgets/pin_code_fields_widget.dart';
import 'package:easy_deal/features/otp/presentation/views/widgets/resend_otp.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/utils/toast/toast.dart';
import '../../../../main_imports.dart';
import '../view_model/forgot_password_cubit.dart';
import '../view_model/forgot_password_states.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  void initState() {
    super.initState();
    context.read<ForgotPasswordCubit>().otpCon.addListener(_onOtpChanged);
  }

  void _onOtpChanged() {
    if (!mounted) return;
    context.read<ForgotPasswordCubit>().onOtpChanged();
    setState(() {});
  }

  @override
  void dispose() {
    try {
      context.read<ForgotPasswordCubit>().otpCon.removeListener(_onOtpChanged);
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return Scaffold(
      appBar: AppBar(title: Text(LangKeys.forgotPassword.tr())),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordStates>(
            listener: (context, state) {
              if (state is ForgotPasswordErrorState) {
                Toast.showErrorToast(
                    msg: state.error.toString(), context: context);
              } else if (state is ForgotPasswordSendOtpSuccessState) {
                Toast.showSuccessToast(
                  msg: state.message.isEmpty
                      ? LangKeys.success.tr()
                      : state.message,
                  context: context,
                );
              } else if (state is ForgotPasswordVerifyOtpSuccessState) {
                Toast.showSuccessToast(
                  msg: state.message.isEmpty
                      ? LangKeys.success.tr()
                      : state.message,
                  context: context,
                );
              } else if (state is ForgotPasswordSuccessState) {
                Toast.showSuccessToast(
                  msg: state.message.isEmpty
                      ? LangKeys.success.tr()
                      : state.message,
                  context: context,
                );
                context.pop();
              }
            },
            buildWhen: (p, c) =>
                c is ForgotPasswordStepChangedState ||
                c is ForgotPasswordLoadingState ||
                c is ForgotPasswordErrorState ||
                c is ForgotPasswordSendOtpSuccessState ||
                c is ForgotPasswordVerifyOtpSuccessState ||
                c is ForgotPasswordChangePasswordVisibleState ||
                c is ForgotPasswordInitState,
            builder: (context, state) {
              final isLoading = state is ForgotPasswordLoadingState;
              if (cubit.step == 1) return _otpStep(cubit, isLoading);
              if (cubit.step == 2) return _passwordStep(cubit, isLoading);
              return _phoneStep(cubit, isLoading);
            },
          ),
        ),
      ),
    );
  }

  Widget _phoneStep(ForgotPasswordCubit cubit, bool isLoading) {
    return Form(
      key: cubit.phoneFormKey,
      child: Column(
        children: [
          Gap(20.h),
          PhoneWidget(
            controller: cubit.phoneCon,
            onPhoneChanged: (v) {
              cubit.phoneNumber = v;
              cubit.validateForm();
            },
            onPhoneChangedWithoutCode: (v) {
              cubit.phoneCon.text = v;
              cubit.validateForm();
            },
          ),
          Gap(24.h),
          if (isLoading)
            const CustomLoading()
          else
            ValueListenableBuilder<bool>(
              valueListenable: cubit.isFormValid,
              builder: (context, isValid, child) => CustomButton(
                text: LangKeys.sendCode.tr(),
                onPressed: isValid ? () => cubit.sendOtp() : null,
              ),
            ),
        ],
      ),
    );
  }

  Widget _otpStep(ForgotPasswordCubit cubit, bool isLoading) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(12.h),
        Center(
          child: Text(
            LangKeys.confirmYourPhoneNumber.tr(),
            style: AppStyles.black20Bold,
          ),
        ),
        Gap(12.h),
        Center(
          child: Text(
            cubit.phoneNumber.isEmpty
                ? cubit.phoneCon.text
                : cubit.phoneNumber,
            style: AppStyles.primary14Medium,
          ),
        ),
        Gap(20.h),
        PinCodeFieldsWidget(controller: cubit.otpCon),
        Gap(12.h),
        ResendOtp(onResend: () => cubit.sendOtp()),
        Gap(8.h),
        Center(
          child: TextButton(
            onPressed: () => cubit.editPhone(),
            child: Text(LangKeys.editMobileNumber.tr()),
          ),
        ),
        Gap(12.h),
        if (isLoading)
          const CustomLoading()
        else
          ConditionalBuilder(
            condition: cubit.otpCon.text.trim().length == 6,
            fallback: (context) => CustomButton(
              text: LangKeys.verifyCode.tr(),
              onPressed: null,
            ),
            builder: (context) => CustomButton(
              text: LangKeys.verifyCode.tr(),
              onPressed: () => cubit.verifyOtp(),
            ),
          ),
      ],
    );
  }

  Widget _passwordStep(ForgotPasswordCubit cubit, bool isLoading) {
    return Form(
      key: cubit.passwordFormKey,
      child: Column(
        children: [
          Gap(20.h),
          CustomTextFormField(
            controller: cubit.passwordCon,
            keyboardType: TextInputType.visiblePassword,
            hintText: LangKeys.newPassword.tr(),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(SvgImages.lock),
            ),
            suffixIcon: IconButton(
              color: AppColors.gray,
              icon: SvgPicture.asset(cubit.isPasswordVisible
                  ? SvgImages.eye
                  : SvgImages.openEye),
              onPressed: cubit.changePasswordVisible,
            ),
            obscureText: cubit.isPasswordVisible,
            onChanged: (_) => cubit.validateForm(),
            validator: (v) => AppValidators.passwordValidator(v),
          ),
          Gap(20.h),
          CustomTextFormField(
            controller: cubit.confirmPasswordCon,
            keyboardType: TextInputType.visiblePassword,
            hintText: LangKeys.confirmPassword.tr(),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(SvgImages.lock),
            ),
            obscureText: cubit.isPasswordVisible,
            onChanged: (_) => cubit.validateForm(),
            validator: (v) => AppValidators.repeatPasswordValidator(
              value: v,
              password: cubit.passwordCon.text,
            ),
          ),
          Gap(24.h),
          if (isLoading)
            const CustomLoading()
          else
            ValueListenableBuilder<bool>(
              valueListenable: cubit.isFormValid,
              builder: (context, isValid, child) => CustomButton(
                text: LangKeys.save.tr(),
                onPressed: isValid ? () => cubit.resetPassword() : null,
              ),
            ),
        ],
      ),
    );
  }
}
