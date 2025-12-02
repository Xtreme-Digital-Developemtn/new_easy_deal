import 'package:easy_deal/features/report_issue/presentation/view_model/report_issue_cubit.dart';
import 'package:easy_deal/main_imports.dart';

import 'issues_list_item.dart';

class IssuesList extends StatelessWidget {
  const IssuesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return IssuesListItem(index: index, title: context.read<ReportIssueCubit>().issuesList[index]);
        },
        separatorBuilder: (context,index){
          return Gap(12.h);
        },
        itemCount: context.read<ReportIssueCubit>().issuesList.length,
    );
  }
}
