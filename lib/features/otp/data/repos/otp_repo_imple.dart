

import '../../../../core/app_services/remote_services/api_service.dart';
import 'otp_repo.dart';


class OtpRepoImpl implements OtpRepo {
  final ApiService? apiService;
  OtpRepoImpl(this.apiService);




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