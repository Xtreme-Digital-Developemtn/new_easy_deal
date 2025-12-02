 import 'package:easy_deal/features/report_issue/presentation/views/widgets/report_issue_button.dart';
import 'package:easy_deal/features/report_issue/presentation/views/widgets/report_issue_message.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import 'issues_list.dart';

class ReportIssueViewBody extends StatelessWidget {
   const ReportIssueViewBody({super.key});

   @override
   Widget build(BuildContext context) {
     return Padding(
       padding:   EdgeInsets.all(20.0.r),
       child: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(LangKeys.pleaseSelectTheReportIssue.tr(),style: AppStyles.primary16SemiBold,),
             Gap(20.h),
             IssuesList(),
             Gap(20.h),
             ReportIssueMessage(),
             Gap(24.h),
             ReportIssueButton(),
           ],
         ),
       ),
     );
   }
 }
