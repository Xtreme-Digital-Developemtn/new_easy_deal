import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class ReportIssueMessage extends StatelessWidget {
  const ReportIssueMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LangKeys.typeTheMessageIfYouWant.tr(),style: AppStyles.primary16SemiBold,),
        Gap(20.h),
        CustomTextFormField(
          maxLines: 5,
          height: 100.h,
        ),
      ],
    );
  }
}
