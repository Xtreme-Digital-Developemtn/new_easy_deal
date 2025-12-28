import 'package:dartz/dartz.dart';
import 'package:easy_deal/features/search/data/repos/search_repo.dart';
import '../../../../main_imports.dart';
import '../models/all_units_model.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService? apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AllUnitsModel>> getAllUnits() async {
    try {
      var response = await apiService!.getData(endPoint: EndPoints.allUnits);
      AllUnitsModel result = AllUnitsModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }
}
