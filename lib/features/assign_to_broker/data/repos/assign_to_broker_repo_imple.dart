
import 'package:easy_deal/features/profile/data/repos/profile_repo.dart';

import '../../../../core/app_services/remote_services/api_service.dart';
import 'assign_to_broker_repo.dart';


class AssignToBrokerRepoImpl implements AssignToBrokerRepo {
  final ApiService? apiService;
  AssignToBrokerRepoImpl(this.apiService);




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