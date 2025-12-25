import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';
import '../models/dynamic_forms_data_model.dart';
import 'create_request_repo.dart';


class CreateRequestRepoImpl implements CreateRequestRepo {
  final ApiService? apiService;
  CreateRequestRepoImpl(this.apiService);




@override
Future<Either<Failure, DynamicFormsDataModel>> getDynamicFormsData({
  required String unit,
  required String type,
  required String specializationScope,
}) async{
  try {
    var response = await apiService!.getData(
      endPoint: EndPoints.dynamicForms,
      query: {
        "specialization_scope" : specializationScope,
        "type" : type,
        "unit" :unit ,
      },
    );
    DynamicFormsDataModel result = DynamicFormsDataModel.fromJson(response.data);
    return right(result);
  } catch (e) {
    return left(handleError(e));
  }
}








}