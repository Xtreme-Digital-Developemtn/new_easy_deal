import 'package:easy_deal/features/report_issue/presentation/views/widgets/report_issue_view_body.dart';
import 'package:easy_deal/main_imports.dart';

class ReportIssueView extends StatelessWidget {
  const ReportIssueView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.reportAnIssue),
      body: ReportIssueViewBody(),
    );
  }
}
