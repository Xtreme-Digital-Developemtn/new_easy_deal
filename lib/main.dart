import 'package:easy_deal/core/extensions/log_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/app_services/notifications/notification_service.dart';
import 'core/app_services/remote_services/service_locator.dart';
import 'core/routing/app_router.dart';
import 'core/utils/bloc_observer.dart';
import 'lang/codegen_loader.g.dart';
import 'main_imports.dart';
import 'my_app.dart';
import 'dart:developer';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();

  String? token = await CacheTokenManger.getUserToken();
  logSuccess("Retrieved token: $token");
  await EasyLocalization.ensureInitialized();

  setup();

  getVmUri();
  Bloc.observer = MyBlocObserver();

  /// لازم بعد `CacheHelper.init()` و`setup()`: جوّاها بنخزّن الـ FCM token
  /// في الكاش وبنبعته عن طريق الريبو المسجّل في getIt.
  await NotificationService.init();

  runApp(
    EasyLocalization(
      startLocale: const Locale('ar', ""),
      supportedLocales: const [
        Locale('ar', ""),
        Locale('en', ""),
      ],
      path: 'lib/lang',
      saveLocale: true,
      fallbackLocale: const Locale('ar', ""),
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: MyApp(
        appRouter: AppRouter( ),
      ),
    ),
  );
}

Future<Uri?> getVmUri() async {
  ServiceProtocolInfo serviceProtocolInfo = await Service.getInfo();
  return serviceProtocolInfo.serverUri;
}
