

import 'package:easy_deal/features/requests/data/repos/requests_repo.dart';

import '../../../../core/app_services/remote_services/api_service.dart';


class RequestsRepoImpl implements RequestsRepo {
  final ApiService? apiService;
  RequestsRepoImpl(this.apiService);




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