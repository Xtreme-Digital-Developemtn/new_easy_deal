

 import 'package:easy_deal/features/home/data/repos/home_repo_imple.dart';
import 'package:easy_deal/features/home/presentation/views/home_view.dart';
import 'package:easy_deal/features/layout/presentation/view_model/layout_cubit.dart';
import 'package:easy_deal/features/layout/presentation/views/layout_view.dart';
import 'package:easy_deal/features/login/data/repos/login_repo_imple.dart';
import 'package:easy_deal/features/login/presentation/view_model/login_cubit.dart';
import 'package:easy_deal/features/login/presentation/views/login_view.dart';

import '../../features/home/presentation/view_model/home_cubit.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../main_imports.dart';
import '../app_services/remote_services/service_locator.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    PageTransition transition<T extends Cubit<Object>>({
      required Widget screen,
      T? cubit,
      Object? arguments,
      PageTransitionType type = PageTransitionType.fade,
      Duration duration = const Duration(milliseconds: 200),
      Alignment alignment = Alignment.center,
    }) {
      final child = cubit != null
          ? BlocProvider<T>(
              create: (context) => cubit,
              child: screen,
            )
          : screen;

      return PageTransition(
        child: child,
        type: type,
        duration: duration,
        alignment: alignment,
        settings: settings,
      );
    }

    switch (settings.name) {
      case Routes.splashView:
        return transition(screen: const SplashView());
      case Routes.loginView:
        return transition(screen: const LoginView(),cubit: LoginCubit(getIt.get<LoginRepoImpl>()));
      case Routes.layoutView:
        return transition(screen: const LayoutView(),);
      default:
        return null;
    }
  }


  List<Widget> screens = [
    BlocProvider(
        create: (context)=>HomeCubit(getIt.get<HomeRepoImpl>()),
        child: HomeView()),
    Text("1"),
    Text("1"),
    Text("1"),
    Text("1"),
    // MoreScreen(),
    // ContractsScreen(),
    // HomeScreen(),
    // BookingScreen(),
    // ProfileScreen(),
  ];
}
