import 'package:easy_localization/easy_localization.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/shared_cubits/auth_cubit/auth_cubit.dart';
import 'core/shared_cubits/lang_cubit/lang_cubit.dart';
import 'core/themes/app_colors.dart';
import 'features/splash/presentation/screens/splash_screen.dart';
import 'main_imports.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()..checkAuthStatus()),
        BlocProvider(create: (context) => LanguageCubit()),
        // BlocProvider(create: (context) => LayoutCubit()),

      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          // Update the app locale when LanguageCubit state changes
          context.setLocale(locale);
          return MaterialApp(
            navigatorKey: navigatorKey,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: locale,
            // locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: "Easy Deal",
            theme: ThemeData(
              fontFamily: locale.languageCode == 'ar' ? "Cairo" : "RobotoCondensed",
              scaffoldBackgroundColor: AppColors.white,
              appBarTheme: const AppBarTheme(
                scrolledUnderElevation: 0,
                backgroundColor: AppColors.warningDark,
              ),
              primarySwatch: Colors.blue,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: AppColors.white,
              ),
            ),
            home: const SplashScreen(),
            builder: (context, child) {
              SystemChrome.setSystemUIOverlayStyle(
                const SystemUiOverlayStyle(
                  systemNavigationBarColor: AppColors.white,
                  systemNavigationBarIconBrightness: Brightness.dark,
                ),
              );
              return ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: const [

                  Breakpoint(start: 0, end: 450, name: MOBILE),
                  Breakpoint(start: 451, end: 800, name: TABLET),
                  Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                ],
              );
            },
          );
        },
      ),
    );
  }
}