import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';
import '../models/send_otp_model.dart';
import 'otp_repo.dart';


class OtpRepoImpl implements OtpRepo {
  final ApiService? apiService;
  OtpRepoImpl(this.apiService);




@override
Future<Either<Failure, SendOtpModel>> sendOtp({required String phone}) async{
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








}