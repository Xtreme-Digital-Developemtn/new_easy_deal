
import '../../../../core/app_services/remote_services/api_service.dart';
import 'home_repo.dart';


class HomeRepoImpl implements HomeRepo {
  final ApiService? apiService;
  HomeRepoImpl(this.apiService);




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