

import 'package:easy_deal/features/report_issue/data/repos/report_issue_repo.dart';
import '../../../../core/app_services/remote_services/api_service.dart';


class ReportIssueRepoImpl implements ReportIssueRepo {
  final ApiService? apiService;
  ReportIssueRepoImpl(this.apiService);




// @override
// Future<Either<Failure, TryThisProductsModel>> getTryThisProductsData() async{
//   try {
//     var response = await apiService!.getData(
//       endPoint: EndPoints.mostSellingProducts,
//     );
//     TryThisProductsModel result = TryThisProductsModel.fromJson(response.data);
//     return right(result);
//   } catch (e) {
//     return left(handleError(e));
//   }
// }








}