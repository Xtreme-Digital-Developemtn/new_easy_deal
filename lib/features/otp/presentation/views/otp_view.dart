import 'package:easy_deal/features/otp/presentation/views/widgets/otp_texts.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
import '../../../../main_imports.dart';
import 'widgets/pin_code_fields_widget.dart';
import 'widgets/resend_otp.dart';
import 'widgets/verify_otp_button.dart';


class OtpView extends StatefulWidget {
  const OtpView({super.key,   required this.contact, required this.isMobile, required this.selectIndex, required this.name, required this.email, required this.password, required this.confirmPassword, required this.gender, required this.role, required this.phone});

  final String contact;
  final bool isMobile;
  final int selectIndex;
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String gender;
  final String role;
  final String phone;
  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _resendCode() {
    context.read<RegisterCubit>().sendOtp(phone: widget.phone);
    _otpController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.verifyCode),
      body: BlocBuilder<RegisterCubit, RegisterStates>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    Scaffold.of(context).appBarMaxHeight! -
                    MediaQuery.of(context).padding.top,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OtpTexts(contact:widget.contact,isMobile: true,),
                  Gap(20.h),
                  PinCodeFieldsWidget(controller: _otpController),
                  Gap(12.h),
                  ResendOtp(onResend: _resendCode),
                  Gap(24.h),
                  VerifyOtpButton(
                    controller: _otpController,
                    isMobile:widget.isMobile,
                    selectIndex: widget.selectIndex,
                    phone: widget.phone,
                    name: widget.name,
                    email: widget.email,
                    phone2: widget.phone,
                    password: widget.password,
                    confirmPassword: widget.confirmPassword,
                    gender: widget.gender,
                    role: widget.role,
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}