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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    await NotificationService.init();
  String? token = await CacheTokenManger.getUserToken();
  debugPrint("Retrieved token: $token");
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  setup();
    Bloc.observer = MyBlocObserver();
  final userRole = CacheHelper.getData(key: "userRole") ?? "client";
  runApp(
    EasyLocalization(
      startLocale: const Locale('en', ""),
      supportedLocales: const [
        Locale('ar', ""),
        Locale('en', ""),
      ],
      path: 'lib/lang',
      saveLocale: true,
      fallbackLocale: const Locale('en', ""),
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: MyApp(
        appRouter: AppRouter(userRole: userRole),
      ),
    ),
  );
}