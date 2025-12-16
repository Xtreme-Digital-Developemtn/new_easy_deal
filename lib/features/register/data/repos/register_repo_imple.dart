import 'package:dartz/dartz.dart';
import 'package:easy_deal/features/register/data/repos/register_repo.dart';
import '../../../../main_imports.dart';
import '../models/register_model.dart';



class RegisterRepoImpl implements RegisterRepo {
  final ApiService? apiService;
  RegisterRepoImpl(this.apiService);

  @override
  Future<Either<Failure, RegisterModel>> register({required FormData data}) async {
    try {
      final response = await apiService!.postData(
        endPoint: EndPoints.register,
        data: data,
        isMultipart: true,
      );
      final result = RegisterModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }




}