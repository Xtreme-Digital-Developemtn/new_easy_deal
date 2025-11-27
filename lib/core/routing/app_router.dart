
import 'package:easy_deal/core/routing/routes_name.dart';

 import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../main_imports.dart';

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
      case Routes.splashScreen:
        return transition(screen: const SplashScreen());


      default:
        return null;
    }
  }


}
