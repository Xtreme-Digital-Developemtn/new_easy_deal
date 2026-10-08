import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';
import 'forgot_password_repo.dart';

class ForgotPasswordRepoImpl implements ForgotPasswordRepo {
  final ApiService? apiService;
  ForgotPasswordRepoImpl(this.apiService);

  String _message(dynamic data) {
    if (data is Map) return data["message"]?.toString() ?? "";
    return "";
  }

  /// الرقم يتبعت دايماً بصفر واحد في الأول:
  /// بيشيل أي مسافات وأصفار زيادة من الأول وبعدين يثبت صفر واحد.
  String _withZero(String phone) {
    var p = phone.trim().replaceAll(RegExp(r'\s+'), '');
    p = p.replaceFirst(RegExp(r'^0+'), '');
    return '0$p';
  }

  @override
  Future<Either<Failure, String>> sendOtp({required String phone}) async {
    try {
      final response = await apiService!.postData(
        endPoint: EndPoints.sendOtp,
        data: FormData.fromMap({"phone": _withZero(phone)}),
        public: true,
      );
      return right(_message(response.data));
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, String>> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await apiService!.postData(
        endPoint: EndPoints.verifyOtp,
        data: FormData.fromMap({
          "phone": _withZero(phone),
          "otp": otp,
        }),
        public: true,
      );
      return right(_message(response.data));
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword({
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await apiService!.postData(
        endPoint: EndPoints.resetPassword,
        data: {
          "phone": _withZero(phone),
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
        public: true,
      );
      return right(_message(response.data));
    } catch (e) {
      return left(handleError(e));
    }
  }
}
