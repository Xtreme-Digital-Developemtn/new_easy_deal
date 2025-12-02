import '../../../../../main_imports.dart';
import '../../view_model/report_issue_cubit.dart';
import '../../view_model/report_issue_states.dart';

class IssuesListItem extends StatelessWidget {
  const IssuesListItem({super.key, required this.index, required this.title});
  final int index;
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportIssueCubit , ReportIssueStates>(
      builder: (context , state) {
        return  InkWell(
          onTap: (){
          ReportIssueCubit.get(context).chooseReason(index);
          },
          child: Container(
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color:  ReportIssueCubit.get(context).reasonIndex == index ?
              AppColors.primaryDark  : AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                  color:
                  ReportIssueCubit.get(context).reasonIndex == index ?
                  AppColors.primaryDark  :
                  const Color(0xffB6B6B6)
              ),
            ),
            child: Center(child: Text(title,
              style:
              AppStyles.white14SemiBold.copyWith(
                color: ReportIssueCubit.get(context).reasonIndex == index ?
                AppColors.white  : const Color(0xffB6B6B6),
              ),)),
          ),
        );
      },

    );
  }
}
