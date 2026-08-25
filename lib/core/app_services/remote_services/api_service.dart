import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main_imports.dart';
import '../../../my_app.dart';
 class ApiService {
  final Dio _dio;
  bool _isRedirecting = false; // instance field بدل local variable

  ApiService(this._dio) {
    _dio.options.baseUrl = EndPoints.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers["Accept"] = "application/json";

          if (options.extra['public'] != true) {
            if (CacheTokenManger.userToken != null &&
                CacheTokenManger.userToken!.isNotEmpty) {
              options.headers["Authorization"] =
              "Bearer ${CacheTokenManger.userToken}";
            }
          }

          debugPrint("➡️ [REQUEST] ${options.method} ${options.uri}");
          debugPrint("Headers: ${options.headers}");
          debugPrint("Data: ${options.data}");
          debugPrint("Query: ${options.queryParameters}");

          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint(
            "✅ [RESPONSE] [${response.statusCode}] ${response.requestOptions.uri}",
          );
          debugPrint("Response Data: ${response.data}");
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          debugPrint("❌ [ERROR] ${error.message}");
          debugPrint("Request: ${error.requestOptions.uri}");

          final failure = ServerFailure.fromDioError(error);
          debugPrint("❌ [ERROR] ${failure.errMessage}");
          if (error.response?.statusCode == 401 && !_isRedirecting) {
            _isRedirecting = true;

            SharedPreferences.getInstance().then((prefs) => prefs.clear());
            CacheTokenManger.userToken = null;

            // نتأكد إن الـ navigator جاهز، ولو لسه بيبني الشجرة ننتظر الفريم اللي جاي
            void doNavigate() {
              MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
                Routes.loginView,
                    (route) => false,
              );
            }

            if (MyApp.navigatorKey.currentState != null) {
              doNavigate();
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) => doNavigate());
            }

            Future.delayed(const Duration(seconds: 1), () {
              _isRedirecting = false;
            });
          }

          return handler.reject(error.copyWith(error: failure));
        },
      ),
    );

    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  Future<Response> postData({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? query,
    bool isMultipart = false,
    bool public = false,
  }) async {
    final options = Options(
      contentType: isMultipart ? "multipart/form-data" : null,
      extra: {'public': public},
    );
    return await _dio.post(endPoint, data: data, queryParameters: query, options: options);
  }

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
    bool public = false,
  }) async {
    return await _dio.get(
      endPoint,
      queryParameters: query,
      options: Options(extra: {'public': public}),
    );
  }

  Future<Response> putData({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? query,
    bool isMultipart = false,
    bool public = false,
  }) async {
    final options = Options(
      contentType: isMultipart ? "multipart/form-data" : null,
      extra: {'public': public},
    );
    return await _dio.put(endPoint, data: data, queryParameters: query, options: options);
  }

  Future<Response> deleteData({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? query,
    bool public = false,
  }) async {
    return await _dio.delete(
      endPoint,
      data: data,
      queryParameters: query,
      options: Options(extra: {'public': public}),
    );
  }
}