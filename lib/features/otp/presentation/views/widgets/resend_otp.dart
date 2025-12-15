import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class ResendOtp extends StatelessWidget {
  const ResendOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LangKeys.didntReceiveIt.tr(),
          style: AppStyles.black16Medium.copyWith(color: AppColors.secondBlack),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            LangKeys.resendOtp.tr(),
            style: AppStyles.primary16SemiBold,
          ),
        ),
      ],
    );
  }
}
