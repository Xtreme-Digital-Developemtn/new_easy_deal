
import 'package:easy_deal/features/search/data/repos/search_repo.dart';

import '../../../../core/app_services/remote_services/api_service.dart';


class SearchRepoImpl implements SearchRepo {
  final ApiService? apiService;
  SearchRepoImpl(this.apiService);




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