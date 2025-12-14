import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'core/app_services/notifications/notification_service.dart';
import 'core/app_services/remote_services/service_locator.dart';
import 'core/routing/app_router.dart';
import 'core/utils/bloc_observer.dart';
import 'lang/codegen_loader.g.dart';
import 'main_imports.dart';
import 'my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.init();
  // const fatalError = true;
  // // Non-async exceptions
  // FlutterError.onError = (errorDetails) {
  //   if (fatalError) {
  //     FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  //   } else {
  //     FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
  //   }
  // };
  //
  // PlatformDispatcher.instance.onError = (error, stack){
  //   if (fatalError) {
  //     FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   } else {
  //     FirebaseCrashlytics.instance.recordError(error, stack);
  //   }
  //   return true;
  // };
  //


  /// sentry with flutter


  String? token = await CacheTokenManger.getUserToken();
  debugPrint("Retrieved token: $token");
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  setup();
  Bloc.observer = MyBlocObserver();
  if(kReleaseMode) {
    await SentryFlutter.init(
        (options) {
      options.dsn = 'https://0bd69a8196c425dc3c7c19c07aa03ce2@o4510244165386240.ingest.us.sentry.io/4510464428015616';
      // Adds request headers and IP for users, for more info visit:
      // https://docs.sentry.io/platforms/dart/guides/flutter/data-management/data-collected/
      options.sendDefaultPii = true;
    },
    appRunner: () =>
        runApp(
      SentryWidget(
        child: EasyLocalization(
          startLocale: const Locale('en',""),
          supportedLocales: const [
            Locale('ar',""),
            Locale('en',""),
          ],
          path: 'lib/lang',
          saveLocale: true,
          fallbackLocale: const Locale('en',""),
          useOnlyLangCode: true,
          assetLoader: const CodegenLoader(),
          child: MyApp(
            appRouter: AppRouter(),
          ),
        ),
      ),
    ),
  );
  }
  else{

    runApp(EasyLocalization(
      startLocale: const Locale('en',""),
      supportedLocales: const [
        Locale('ar',""),
        Locale('en',""),
      ],
      path: 'lib/lang',
      saveLocale: true,
      fallbackLocale: const Locale('en',""),
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: MyApp(
        appRouter: AppRouter(),
      ),
    ),);
  }

}