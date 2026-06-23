import 'dart:async';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class ResendOtp extends StatefulWidget {
  final VoidCallback? onResend;

  const ResendOtp({super.key, this.onResend});

  @override
  State<ResendOtp> createState() => _ResendOtpState();
}

class _ResendOtpState extends State<ResendOtp> {
  Timer? _timer;
  int _remainingSeconds = 180;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _remainingSeconds = 180;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        _timer?.cancel();
      }
    });
  }

  String get _formattedTime {
    final min = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final sec = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return '$min:$sec';
  }

  void _resend() {
    widget.onResend?.call();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    if (_remainingSeconds > 0) {
      return Center(
        child: Text(
          _formattedTime,
          style: AppStyles.black16SemiBold.copyWith(color: AppColors.primaryDark),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LangKeys.didntReceiveIt.tr(),
          style: AppStyles.black16Medium.copyWith(color: AppColors.secondBlack),
        ),
        TextButton(
          onPressed: _resend,
          child: Text(
            LangKeys.resendOtp.tr(),
            style: AppStyles.primary16SemiBold.copyWith(
              color: AppColors.primaryDark,
            ),
          ),
        ),
      ],
    );
  }
}