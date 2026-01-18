import 'package:easy_deal/features/report_issue/data/models/report_issue_model.dart';
import 'package:easy_deal/features/report_issue/presentation/view_model/report_issue_states.dart';
import '../../../../core/utils/params/report_issue_parms.dart';
import '../../../../main_imports.dart';
import '../../data/repos/report_issue_repo.dart';

class ReportIssueCubit extends Cubit<ReportIssueStates> {
  ReportIssueCubit(this.reportIssueRepo) : super(ReportIssueInitState());

  ReportIssueRepo? reportIssueRepo;

  static ReportIssueCubit get(context) => BlocProvider.of(context);

  int reasonIndex = 0;
  var messageCon = TextEditingController();

  chooseReason(index) {
    reasonIndex = index;
    emit(ReportIssuesChooseReasonState());
  }

  List<String> issuesList = ["Issues 1", "Issues 2", "Issues 3"];

  var issueCon = TextEditingController();

  ReportIssueModel? reportIssueModel;

  Future<void> reportsIssue({
    required ReportIssueParms reportIssueParms,
  }) async {
    emit(ReportIssueLoadingState());
    final result = await reportIssueRepo!.reportIssue(
      reportIssueParms: reportIssueParms,
    );
    return result.fold(
      (failure) {
        emit(ReportIssueErrorState(failure.errMessage));
      },
      (data) async {
        reportIssueModel = data;
        emit(ReportIssueSuccessState(data));
      },
    );
  }


  void clearControllers()
  {
    messageCon.clear();
    issueCon.clear();
    emit(ReportIssueInitState());
  }
}
