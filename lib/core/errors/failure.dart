import 'package:dio/dio.dart';


abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("connectionTimeOut");
      case DioExceptionType.sendTimeout:
        return ServerFailure("sendTimeOut");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receiveTimeOut");
      case DioExceptionType.badResponse:
        // كان `response!.statusCode!`: أي واحد منهم null كان بيرمي استثناء
        // من جوه معالج الأخطاء نفسه، فالطلب يفضل معلّق في حالة التحميل.
        final statusCode = dioException.response?.statusCode;
        if (statusCode == null) {
          return ServerFailure("unexpectedError");
        }
        return ServerFailure.fromResponse(
            statusCode, dioException.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure("requestCanceled");
      // النوع ده هو اللي dio بيرجّعه لما مفيش نت خالص (مش unknown)، وكان
      // واقع في الـ default برسالة إنجليزي ثابتة مش مترجمة.
      case DioExceptionType.connectionError:
        return ServerFailure("noInternet");
      case DioExceptionType.badCertificate:
        return ServerFailure("unexpectedError");
      case DioExceptionType.unknown:
        // كان `dioException.error!`: لو الـ error بـ null بيرمي استثناء.
        if (dioException.error?.toString().contains("SocketException") ??
            false) {
          return ServerFailure("noInternet");
        } else {
          return ServerFailure("unexpectedError");
        }
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    String errorMessage = "Something went wrong. Please try again";

    // Handle different response types
    if (response is Map<String, dynamic>) {
      // JSON response
      errorMessage = response["message"]?.toString() ?? errorMessage;

      // أخطاء التحقق (422) بتيجي في "errors" لكل حقل، و"message" بتبقى
      // رسالة عامة زي "The given data was invalid"، فالمستخدم مكانش بيعرف
      // إن الرقم مثلاً مستخدم بحساب تاني. بناخد أول رسالة حقل لو موجودة.
      final fieldError = _firstFieldError(response["errors"]);
      if (fieldError != null) {
        errorMessage = fieldError;
      }
    } else if (response is String) {
      // Plain text response (common for 500 errors)
      errorMessage = response.isNotEmpty ? response : errorMessage;
    }

    // Handle specific status codes
    if (statusCode == 400 || statusCode == 401 || statusCode == 403 || statusCode == 422) {
      return ServerFailure(errorMessage);
    } else if (statusCode == 500) {
      return ServerFailure(errorMessage.isEmpty ? "Internal server error" : errorMessage);
    } else if (statusCode == 404) {
      return ServerFailure("Request not found");
    } else {
      return ServerFailure(errorMessage);
    }
  }

  /// بترجّع أول رسالة خطأ لحقل من شكل {"phone": ["..."], "email": ["..."]}.
  static String? _firstFieldError(dynamic errors) {
    if (errors is! Map) return null;
    for (final value in errors.values) {
      if (value is List && value.isNotEmpty) {
        final first = value.first?.toString().trim();
        if (first != null && first.isNotEmpty) return first;
      } else if (value is String && value.trim().isNotEmpty) {
        return value.trim();
      }
    }
    return null;
  }
}