import 'package:easy_deal/features/edit_profile/data/repos/edit_profile_repo_imple.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/app_services/remote_services/service_locator.dart';
import 'core/routing/app_router.dart';
import 'core/shared_cubits/auth_cubit/auth_cubit.dart';
import 'core/shared_cubits/session/app_session.dart';
import 'core/shared_cubits/lang_cubit/lang_cubit.dart';
import 'features/broker_features/broker_developers/data/repos/broker_developers_repo_imple.dart';
import 'features/broker_features/broker_developers/presentation/view_model/broker_developers_cubit.dart';
import 'features/profile/data/repos/profile_repo_imple.dart';
import 'features/register/data/repos/register_repo_imple.dart';
import 'features/register/presentation/views/widgets/password_widgets/password_body.dart';
import 'main_imports.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  static int _navigatorKeyEpoch = -1;
  static GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  /// مفتاح الناڤيجيتور بيتجدّد مع كل إعادة بناء للجلسة.
  ///
  /// كان مفتاح واحد ثابت: وقت إعادة البناء بتفضل الشجرة القديمة موجودة
  /// والجديدة بتتبني في نفس الباس، فبيبقى فيه نافيجيتورين بنفس الـ
  /// GlobalKey — وده بيرمي "Duplicate GlobalKey" وبتفضل الشاشة فاضية
  /// لحد ما فلاتر يرتّب نفسه. مفتاح لكل epoch بيمنع التصادم ده.
  static GlobalKey<NavigatorState> get navigatorKey {
    if (_navigatorKeyEpoch != AppSession.epoch.value) {
      _navigatorKeyEpoch = AppSession.epoch.value;
      _navigatorKey = GlobalKey<NavigatorState>();
    }
    return _navigatorKey;
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        // أي دخول/خروج بيزوّد AppSession.epoch، والـ key اللي جواها بتخلي
        // الشجرة كلها (المزوّدين + MaterialApp + Navigator) تتبني من الأول —
        // يعني كل كيوبت عام بيتعمل من جديد ويحمّل بيانات الأكونت الحالي،
        // بالظبط زي فتح التطبيق من غير ما المستخدم يقفله.
        // خلفية بيضا تحت كل حاجة: وقت إعادة البناء والانتقال بين الشاشات
        // بيعدّي فريم أو اتنين مفيش فيهم حاجة مرسومة، وكان بيبان أسود.
        child: ColoredBox(
          color: AppColors.white,
          child: ValueListenableBuilder<int>(
          valueListenable: AppSession.epoch,
          builder: (context, epoch, _) => KeyedSubtree(
            key: ValueKey('app-session-$epoch'),
            child: Builder(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => AuthCubit()..checkAuthStatus()),
                BlocProvider(create: (context) => LanguageCubit()),
                BlocProvider(create: (context) => EditProfileCubit(getIt.get<EditProfileRepoImpl>())),
                 BlocProvider(create: (context) => RegisterCubit(getIt.get<RegisterRepoImpl>())),
                 BlocProvider(create: (context) => BrokerDevelopersCubit(getIt.get<BrokerDevelopersRepoImpl>())),
                BlocProvider(create: (context) => ProfileCubit(
                    getIt.get<ProfileRepoImpl>())..loadCurrentUser()..getSocialMedia()),

              ],
              child: BlocBuilder<LanguageCubit, Locale>(
                builder: (context, locale) {
                  context.setLocale(locale);
                  return MaterialApp(
                    navigatorKey: navigatorKey,
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    debugShowCheckedModeBanner: false,
                    title: "Easy Deal",
                    theme: ThemeData(
                      fontFamily: locale.languageCode == 'ar' ? "Cairo" : "neue-haas-grotesk-display-pro-cufonfonts",
                      scaffoldBackgroundColor: AppColors.white,
                      appBarTheme: const AppBarTheme(
                        scrolledUnderElevation: 0,
                        backgroundColor: AppColors.white,
                      ),
                      primarySwatch: Colors.blue,
                      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                        backgroundColor: AppColors.white,
                      ),
                    ),
                    // home: Scaffold(body: PasswordBody()),
                    // أول تشغيل بس بيبدأ من السبلاش (أونبوردنج + تحقق
                    // التوكن). بعد دخول/خروج بنبدأ على طول من الشاشة
                    // المناسبة بدل ما المستخدم يستنى السبلاش تاني.
                    initialRoute: AppSession.isFirstLaunch
                        ? Routes.splashView
                        : (CacheTokenManger.userToken != null
                            ? Routes.layoutView
                            : Routes.loginView),
                    onGenerateRoute: appRouter.generateRoute,
                    builder: (context, child) {
                      SystemChrome.setSystemUIOverlayStyle(
                        const SystemUiOverlayStyle(
                          systemNavigationBarColor: AppColors.white,
                          systemNavigationBarIconBrightness: Brightness.dark,
                        ),
                      );
                      // الانتقال بين الشاشات fade، ولو مفيش شاشة ورا
                      // الشاشة الجديدة (نافيجيتور لسه اتعمل) كان بيبان
                      // أسود وراها.
                      return ColoredBox(
                        color: AppColors.white,
                        child: ResponsiveBreakpoints.builder(
                          child: child!,
                          breakpoints: const [
                            Breakpoint(start: 0, end: 450, name: MOBILE),
                            Breakpoint(start: 451, end: 800, name: TABLET),
                            Breakpoint(start: 801, end: 1920, name: DESKTOP),
                            Breakpoint(
                                start: 1921, end: double.infinity, name: '4K'),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }
            ),
          ),
        ),
        ),
      ),
    );
  }
}