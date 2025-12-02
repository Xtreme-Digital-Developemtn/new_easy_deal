import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import 'faqs_list.dart';

class FaqsViewBody extends StatelessWidget {
  const FaqsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LangKeys.commonQuestions.tr(),
            style: AppStyles.primary16SemiBold,
          ),

          Gap(12.h),
          FAQsList(),
        ],
      ),
    );
  }
}
