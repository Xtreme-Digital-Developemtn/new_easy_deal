import 'package:easy_deal/features/report_issue/data/models/report_issue_model.dart';

abstract class ReportIssueStates{}

class ReportIssueInitState extends ReportIssueStates{}

class ReportIssuesChooseReasonState extends ReportIssueStates{}

class ReportIssueLoadingState extends ReportIssueStates{}
class ReportIssueErrorState extends ReportIssueStates{
  final String error;
  ReportIssueErrorState(this.error);
}
class ReportIssueSuccessState extends ReportIssueStates{
  final ReportIssueModel reportIssueModel;
  ReportIssueSuccessState(this.reportIssueModel);

}