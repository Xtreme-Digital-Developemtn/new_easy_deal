import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_imports.dart';

class OtpTexts extends StatelessWidget {
  const OtpTexts({super.key, required this.contact, required this.isMobile});

  final String contact;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.tr(
            isMobile == true
                ? LangKeys.confirmYourPhoneNumber
                : LangKeys.confirmYourEmail,
          ),
          style: AppStyles.black20Bold,
        ),
        Gap(20.h),
        Text(
          context.tr(LangKeys.enterThe4DigitNumberSentTo),
          style: AppStyles.gray14Medium,
        ),
        Gap(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(
              builder: (context) {
                return Text(contact, style: AppStyles.primary14Medium);
              },
            ),
            Gap(8.w),
            InkWell(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(SvgImages.edit),
            ),
          ],
        ),
      ],
    );
  }
}
