 import 'package:easy_deal/features/report_issue/presentation/view_model/report_issue_cubit.dart';
import 'package:easy_deal/features/report_issue/presentation/views/widgets/report_issue_button.dart';
import 'package:easy_deal/features/report_issue/presentation/views/widgets/report_issue_message.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
class ReportIssueViewBody extends StatelessWidget {
   const ReportIssueViewBody({super.key});

   @override
   Widget build(BuildContext context) {
     final formKey = GlobalKey<FormState>();
     return Padding(
       padding:   EdgeInsets.all(20.0.r),
       child: SingleChildScrollView(
         child: Form(
           key: formKey,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [

               // Text(LangKeys.pleaseSelectTheReportIssue.tr(),style: AppStyles.primary16SemiBold,),
               // Gap(20.h),
               // IssuesList(),
               Text(LangKeys.enterTheIssueTitle.tr(),style: AppStyles.primary16SemiBold,),
               Gap(12.h),
               CustomTextFormField(
                 hintText: LangKeys.title.tr(),
                 controller: context.read<ReportIssueCubit>().issueCon,
                 validator: (value) => AppValidators.displayNameValidator(value),
               ),
               Gap(20.h),
               ReportIssueMessage(),
               Gap(24.h),
               ReportIssueButton(formKey : formKey),
             ],
           ),
         ),
       ),
     );
   }
 }
