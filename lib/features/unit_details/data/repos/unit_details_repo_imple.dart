import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';
import '../models/unit_details_model.dart';
import 'unit_details_repo.dart';

class UnitDetailsRepoImpl implements UnitDetailsRepo {
  final ApiService? apiService;

  UnitDetailsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UnitDetailsModel>> getUnitDetails({required int unitId}) async {
    try {
      var response = await apiService!.getData(
        endPoint: "${EndPoints.unitDetails}/$unitId",
      );
      UnitDetailsModel result = UnitDetailsModel.fromJson(
        response.data,
      );
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }
}
