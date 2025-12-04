import 'package:easy_deal/features/otp/presentation/views/widgets/otp_texts.dart';
import '../../../../main_imports.dart';
import 'widgets/pin_code_fields_widget.dart';
import 'widgets/verify_otp_button.dart';
import '../view_model/otp_cubit.dart';
import '../view_model/otp_states.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key,   required this.contact, required this.isMobile});

  final String contact;
  final bool isMobile;
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OtpTexts(contact:widget.contact,isMobile: false,),
                      Gap(20.h),
                      PinCodeFieldsWidget(controller: _otpController),
                      Gap(20.h),
                    ],
                  ),
                  Column(
                    children: [
                    VerifyOtpButton(controller: _otpController, isMobile:widget.isMobile, ),
                      SizedBox(
                        height: 50 + MediaQuery.of(context).viewInsets.bottom,
                      ),
                    ],
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