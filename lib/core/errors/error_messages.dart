import 'package:easy_localization/easy_localization.dart';

import '../../lang/lang_keys.dart';

/// [ServerFailure] يرجّع أكواد ثابتة (noInternet / unexpectedError / ...) مش
/// رسائل جاهزة للعرض، فلو عرضناها زي ما هي المستخدم بيشوف كلمة إنجليزي غريبة.
/// الدالة دي بتترجم الأكواد المعروفة وبتسيب أي رسالة جاية من السيرفر زي ما هي.
String localizeErrorMessage(String message) {
  switch (message.trim()) {
    case 'noInternet':
      return LangKeys.noInternetError.tr();
    case 'connectionTimeOut':
    case 'sendTimeOut':
    case 'receiveTimeOut':
      return LangKeys.connectionTimeOutError.tr();
    case 'requestCanceled':
      return LangKeys.requestCanceledError.tr();
    case 'unexpectedError':
      return LangKeys.unexpectedError.tr();
    default:
      return message;
  }
}
