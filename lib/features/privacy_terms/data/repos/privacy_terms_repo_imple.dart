
import 'package:easy_deal/features/privacy_terms/data/repos/privacy_terms_repo.dart';

import '../../../../core/app_services/remote_services/api_service.dart';


class PrivacyTermsRepoImpl implements PrivacyTermsRepo {
  final ApiService? apiService;
  PrivacyTermsRepoImpl(this.apiService);




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