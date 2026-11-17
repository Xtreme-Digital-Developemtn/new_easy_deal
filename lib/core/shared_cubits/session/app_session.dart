import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

import '../../../my_app.dart';
import '../../utils/toast/toast.dart';

import '../../../features/layout/presentation/view_model/layout_cubit.dart';
import '../../app_services/local_services/cache_token.dart';
import '../../utils/app_consts/session_cache.dart';

/// إعادة تشغيل الجلسة: أي دخول أو خروج يخلي التطبيق يبدأ من الأول.
///
/// المشكلة اللي بيحلها: الكيوبتس العامة (البروفايل، تعديل البروفايل،
/// المطوّرين...) متعمولة فوق الـ MaterialApp وبتعيش طول عمر التطبيق،
/// وكمان فيه حالة ستاتيك (تاب اللاي أوت، التوكن). فبعد تسجيل خروج ودخول
/// بأكونت تاني كان لازم تقفل التطبيق وتفتحه عشان كل حاجة تتحمّل من جديد.
///
/// بدل ما نفضل نفتكر كل كيوبت وكل متغير ستاتيك لازم يتصفّر، [epoch] بتتغيّر
/// فشجرة التطبيق كلها (المزوّدين + الـ MaterialApp + الـ Navigator) تتبني من
/// الأول — بالظبط زي فتح التطبيق، بس من غير سبلاش.
class AppSession {
  const AppSession._();

  /// بيزيد مع كل دخول/خروج. `MyApp` بتسمعه وبتعيد بناء الشجرة.
  static final ValueNotifier<int> epoch = ValueNotifier<int>(0);

  /// true لأول تشغيل بس: ساعتها بنبدأ من السبلاش (أونبوردنج/تحقق التوكن).
  static bool get isFirstLaunch => epoch.value == 0;

  /// بعد تسجيل دخول/تسجيل حساب ناجح (التوكن والهوية بيكونوا اتخزنوا قبل كده).
  static void signedIn() => _restart();

  /// تسجيل خروج: بنشيل التوكن وهوية الأكونت، وبعدين نبني التطبيق من الأول.
  static void signedOut() {
    CacheTokenManger.userToken = null;
    CacheTokenManger.clearUserToken();
    SessionCache.clear();
    _restart();
  }

  static void _restart() {
    // الحالة الستاتيك الوحيدة اللي بتعيش بره الشجرة.
    LayoutCubit.pageIndex = 0;

    // لو إحنا جوه فريم شغّال (مثلاً 401 جه وإحنا بنبني شاشة)، تغيير الـ
    // epoch وقتها معناه إعادة بناء وسط البناء. بنأجّله لآخر الفريم.
    final phase = SchedulerBinding.instance.schedulerPhase;
    if (phase == SchedulerPhase.idle ||
        phase == SchedulerPhase.postFrameCallbacks) {
      epoch.value++;
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) => epoch.value++);
    }
  }

  /// بيعرض توست بعد إعادة البناء. الـ context اللي جوه شاشة الدخول/الخروج
  /// بيتفكّك مع الشجرة القديمة، فالتوست لازم يستعمل شجرة التطبيق الجديدة.
  static void showToastAfterRestart(String message, {required bool isError}) {
    if (message.trim().isEmpty) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = MyApp.navigatorKey.currentContext;
      if (ctx == null) return;
      isError
          ? Toast.showErrorToast(msg: message, context: ctx)
          : Toast.showSuccessToast(msg: message, context: ctx);
    });
  }
}
