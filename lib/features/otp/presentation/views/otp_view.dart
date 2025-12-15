import 'package:easy_deal/features/otp/presentation/views/widgets/otp_texts.dart';
import 'package:easy_deal/features/otp/presentation/views/widgets/resend_otp.dart';
import '../../../../main_imports.dart';
import 'widgets/pin_code_fields_widget.dart';
import 'widgets/verify_otp_button.dart';
import '../view_model/otp_cubit.dart';
import '../view_model/otp_states.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key,   required this.contact, required this.isMobile, required this.selectIndex});

  final String contact;
  final bool isMobile;
  final int selectIndex;
  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.verifyCode),
      body: BlocBuilder<OtpCubit, OtpStates>(
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
                  OtpTexts(contact:widget.contact,isMobile: false,),
                  Gap(20.h),
                  PinCodeFieldsWidget(controller: _otpController),
                  Gap(12.h),
                  ResendOtp(),
                  Gap(24.h),
                  VerifyOtpButton(controller: _otpController, isMobile:widget.isMobile, selectIndex: widget.selectIndex,),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}