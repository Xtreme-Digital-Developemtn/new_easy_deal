import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class BrokerVerifiedMark extends StatelessWidget {
  const BrokerVerifiedMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(SvgImages.verified,height:25.h ,width: 25.w,),
        Gap(6.w),
        Text(LangKeys.verifyCode.tr(),style: AppStyles.blueDark14Bold,),
      ],
    );
  }
}
