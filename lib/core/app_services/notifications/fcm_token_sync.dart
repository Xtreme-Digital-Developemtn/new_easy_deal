import 'package:dartz/dartz.dart';
import 'package:easy_deal/core/extensions/log_util.dart';

import '../../../features/layout/data/models/send_fcm_model.dart';
import '../../../features/layout/data/repos/layout_repo_imple.dart';
import '../../../main_imports.dart';
import '../remote_services/service_locator.dart';
import 'notification_service.dart';

/// المسؤول الوحيد عن تسجيل الـ FCM token عند السيرفر.
///
/// قبل كده كان الإرسال بيحصل مرة واحدة من راوت الـ layout بتوكن
/// بيتقرا من الكاش بدون أي تحقق: لو لسه مش متخزّن كانت القيمة null
/// وبتتحقن في بارامتر `required String` فيرمي TypeError قبل ما
/// الريكوست يتبعت أصلاً — والسيرفر يفضل من غير توكن والإشعارات متوصلش.
class FcmTokenSync {
  FcmTokenSync._();

  static String? _lastSentToken;
  static bool _inFlight = false;

  /// بيتنادى عند تسجيل الخروج: التوكن اللي بعتناه بقى لمستخدم تاني،
  /// فلازم يتبعت من جديد بعد أي تسجيل دخول.
  static void reset() {
    _lastSentToken = null;
  }

  /// بيبعت التوكن للسيرفر.
  ///
  /// بيرجّع `null` لو الإرسال اتخطّى (مفيش توكن، مفيش مستخدم مسجّل،
  /// أو نفس التوكن اتبعت قبل كده) عشان اللي بينادي يعرف الفرق بين
  /// "اتخطّى" و"فشل".
  static Future<Either<Failure, SendFcmModel>?> sync({
    bool force = false,
  }) async {
    if (_inFlight) return null;

    final fcmToken = await NotificationService.currentToken();
    if (fcmToken == null || fcmToken.isEmpty) {
      logWarning('FcmTokenSync: مفيش FCM token لسه');
      return null;
    }

    /// الإندبوينت محمي بـ Bearer، فإرساله قبل الدخول بيرجّع 401 بس.
    final userToken = await CacheTokenManger.getUserToken();
    if (userToken == null || userToken.isEmpty) return null;

    if (!force && _lastSentToken == fcmToken) return null;

    if (!getIt.isRegistered<LayoutRepoImpl>()) {
      logError('FcmTokenSync: LayoutRepoImpl مش مسجّل في getIt');
      return null;
    }

    _inFlight = true;
    try {
      final result = await getIt
          .get<LayoutRepoImpl>()
          .sendFcmToken(fcmToken: fcmToken);
      result.fold(
        (failure) => logError('FcmTokenSync failed: ${failure.errMessage}'),
        (_) {
          _lastSentToken = fcmToken;
          logSuccess('FcmTokenSync: التوكن اتسجّل عند السيرفر');
        },
      );
      return result;
    } finally {
      _inFlight = false;
    }
  }
}
