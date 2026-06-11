import 'package:dartz/dartz.dart';
import 'package:easy_deal/features/register/data/repos/register_repo.dart';
import '../../../../main_imports.dart';
import '../models/register_model.dart';
import '../models/send_otp_model.dart';
import '../models/verify_otp_model.dart';



class RegisterRepoImpl implements RegisterRepo {
  final ApiService? apiService;
  RegisterRepoImpl(this.apiService);

  @override
  Future<Either<Failure, RegisterModel>> register({required FormData data})
  async {
    try {
      final response = await apiService!.postData(
        endPoint: EndPoints.register,
        data: data,
        isMultipart: true,
        public: true,
      );
      final result = RegisterModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, SendOtpModel>> sendOtp({required String phone})
  async{
    try {
      var data = FormData.fromMap({
        'phone':phone,
      });
      var response = await apiService!.postData(
        endPoint: EndPoints.sendOtp,
        data:data,
      );
      SendOtpModel result = SendOtpModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, VerifyOtpModel>> verifyOtp({required String otp,required String phone})
  async{
    try {
      var data = FormData.fromMap({
        'phone':phone,
        'otp':otp,
      });
      var response = await apiService!.postData(
        endPoint: EndPoints.verifyOtp,
        data:data,
      );
      VerifyOtpModel result = VerifyOtpModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }





}