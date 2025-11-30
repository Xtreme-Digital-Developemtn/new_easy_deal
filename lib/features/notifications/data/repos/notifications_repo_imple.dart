
import '../../../../core/app_services/remote_services/api_service.dart';
import 'notifications_repo.dart';


class NotificationsRepoImpl implements NotificationsRepo {
  final ApiService? apiService;
  NotificationsRepoImpl(this.apiService);




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