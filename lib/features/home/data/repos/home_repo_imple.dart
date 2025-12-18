import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';
import '../models/best_seller_units_model.dart';
import 'home_repo.dart';


class HomeRepoImpl implements HomeRepo {
  final ApiService? apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, BestSellerUnitsModel>> getBestSellerUnitsInHome() async{
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.bestSellerUnitsInHome,
        query: {
          "limit" : 4,
          "offset" : 0,
        }
      );
      BestSellerUnitsModel result = BestSellerUnitsModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }








}