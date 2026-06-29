import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/otp/presentation/views/widgets/pin_code_fields_widget.dart';
import 'package:easy_deal/features/otp/presentation/views/widgets/resend_otp.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class OtpBody extends StatefulWidget {
  const OtpBody({super.key});

  @override
  State<OtpBody> createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  final TextEditingController _otpController = TextEditingController();
  bool _otpSent = false;

  @override
  void initState() {
    super.initState();
    _otpController.addListener(_onOtpChanged);
    _sendOtp();
  }

  void _onOtpChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _otpController.removeListener(_onOtpChanged);
    super.dispose();
  }

  void _sendOtp() {
    final cubit = context.read<RegisterCubit>();
    cubit.sendOtp(phone: cubit.phoneCon.text);
    _otpSent = true;
  }

  void _resendCode() {
    final cubit = context.read<RegisterCubit>();
    cubit.sendOtp(phone: cubit.phoneCon.text);
    _otpController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is SendOtpSuccessState) {
          if (!_otpSent) return;
          Toast.showSuccessToast(
            msg: state.sendOtpModel.message.toString(),
            context: context,
          );
        } else if (state is SendOtpErrorState) {
          Toast.showErrorToast(msg: state.error.toString(), context: context);
        } else if (state is VerifyOtpSuccessState) {
          cubit.otpVerified = true;
          Toast.showSuccessToast(
            msg: state.verifyOtpModel.message.toString(),
            context: context,
          );
          WidgetsBinding.instance.addPostFrameCallback((_) {
            cubit.changeStepperIndex(4);
          });
        } else if (state is VerifyOtpErrorState) {
          Toast.showErrorToast(msg: state.error, context: context);
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                context.tr(LangKeys.confirmYourPhoneNumber),
                style: AppStyles.black20Bold,
              ),
            ),
            Gap(20.h),
            Center(
              child: Text(
                context.tr(LangKeys.enterThe4DigitNumberSentTo),
                style: AppStyles.gray14Medium,
              ),
            ),
            Gap(12.h),
            Center(
              child: Text(
                cubit.phoneNumber,
                style: AppStyles.primary14Medium,
              ),
            ),
            Gap(20.h),
            PinCodeFieldsWidget(controller: _otpController),
            Gap(12.h),
            ResendOtp(onResend: _resendCode),
            Gap(24.h),
            if (state is VerifyOtpLoadingState)
              const CustomLoading()
            else
              CustomButton(
                text: context.tr(LangKeys.verifyCode),
                onPressed: _otpController.text.length == 6
                    ? () {
                        context.read<RegisterCubit>().verifyOtp(
                          otp: _otpController.text,
                          phone: cubit.phoneCon.text,
                        );
                      }
                    : null,
              ),
          ],
        );
      },
    );
  }
}
