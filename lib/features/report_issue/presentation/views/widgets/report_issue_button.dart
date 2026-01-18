  import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/core/utils/params/report_issue_parms.dart';
import 'package:easy_deal/features/report_issue/presentation/view_model/report_issue_cubit.dart';
import 'package:easy_deal/features/report_issue/presentation/view_model/report_issue_states.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/utils/toast/toast.dart';
import '../../../../../main_imports.dart';

class ReportIssueButton extends StatelessWidget {
  const ReportIssueButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportIssueCubit , ReportIssueStates>(
      listener: (context,state){
        if(state is ReportIssueSuccessState){
          Toast.showSuccessToast(msg: state.reportIssueModel.message.toString(), context: context);
          context.read<ReportIssueCubit>().clearControllers;
        }else if (state is ReportIssueErrorState){
          Toast.showErrorToast(msg: state.error.toString(), context: context);
        }
      },
      builder: (context,state){
        var reportIssueCubit = context.read<ReportIssueCubit>();
        return ConditionalBuilder(
          condition: state is ! ReportIssueLoadingState,
          fallback: (context)=>CustomLoading(),
          builder: (context){
            return CustomButton(
              gradientColors: false,
              onPressed: (){
                if(formKey.currentState!.validate()){
                  reportIssueCubit.reportsIssue(
                    reportIssueParms: ReportIssueParms(
                      phone: CacheHelper.getData(key: "userPhone"),
                      email: CacheHelper.getData(key: "userEmail"),
                      title: reportIssueCubit.issueCon.text,
                      description: reportIssueCubit.messageCon.text,
                      isActive: true,
                      type: "issue",
                      context: context,
                    ),
                  );
                }


              },
              text: LangKeys.send.tr(),
            );
          },

        );
      },

    );
  }
}
