

 import 'package:easy_deal/features/category_units/data/repos/category_units_repo_imple.dart';
import 'package:easy_deal/features/change_password/presentation/views/change_password_view.dart';
import 'package:easy_deal/features/edit_profile/data/repos/edit_profile_repo_imple.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/edit_email.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/edit_profile_view.dart';
import 'package:easy_deal/features/home/data/repos/home_repo_imple.dart';
import 'package:easy_deal/features/home/presentation/views/home_view.dart';
 import 'package:easy_deal/features/layout/presentation/views/layout_view.dart';
import 'package:easy_deal/features/login/data/repos/login_repo_imple.dart';
import 'package:easy_deal/features/login/presentation/view_model/login_cubit.dart';
import 'package:easy_deal/features/login/presentation/views/login_view.dart';
import 'package:easy_deal/features/search/presentation/views/search_view.dart';

import '../../features/category_units/presentation/view_model/category_units_cubit.dart';
import '../../features/category_units/presentation/views/category_units_view.dart';
import '../../features/change_password/data/repos/change_password_repo_imple.dart';
import '../../features/change_password/presentation/view_model/change_password_cubit.dart';
import '../../features/chats/data/repos/chats_repo_imple.dart';
import '../../features/chats/presentation/view_model/chats_cubit.dart';
import '../../features/chats/presentation/views/chats_view.dart';
import '../../features/home/presentation/view_model/home_cubit.dart';
import '../../features/notifications/data/repos/notifications_repo_imple.dart';
import '../../features/notifications/presentation/view_model/notifications_cubit.dart';
import '../../features/notifications/presentation/views/notifications_view.dart';
import '../../features/otp/data/repos/otp_repo_imple.dart';
import '../../features/otp/presentation/view_model/otp_cubit.dart';
import '../../features/otp/presentation/views/otp_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/search/data/repos/search_repo_imple.dart';
import '../../features/search/presentation/view_model/search_cubit.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/unit_details/data/repos/unit_details_repo_imple.dart';
import '../../features/unit_details/presentation/view_model/unit_details_cubit.dart';
import '../../features/unit_details/presentation/views/unit_details_view.dart';
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
      case Routes.editProfileView:
        return transition(screen: const EditProfileView(),cubit: EditProfileCubit(getIt.get<EditProfileRepoImpl>()));
      case Routes.editEmailView:
        return transition(screen: BlocProvider.value(
            value: EditProfileCubit(getIt.get<EditProfileRepoImpl>()),
            child: const EditEmailView()),);
      case Routes.notificationsView:
        return transition(screen: const NotificationsView(),cubit: NotificationsCubit(getIt.get<NotificationsRepoImpl>()));
        case Routes.categoryUnitsView:
        final args = arguments as Map<String, dynamic>;
        return transition(screen:   CategoryUnitsView(
          categoryName: args["categoryName"] as String,
        )
            ,cubit: CategoryUnitsCubit(getIt.get<CategoryUnitsRepoImpl>()));
      case Routes.searchView:
        return transition(screen: const SearchView(),cubit: SearchCubit(getIt.get<SearchRepoImpl>()));
      case Routes.otpView:
        final args = arguments as Map<String, dynamic>;
        return transition(screen:   OtpView(
          contact: args["contact"] as String,
          isMobile: args["isMobile"] as bool,
        ),cubit: OtpCubit(getIt.get<OtpRepoImpl>()));
      case Routes.changePasswordView:
        return transition(screen: const ChangePasswordView(),
            cubit: ChangePasswordCubit(getIt.get<ChangePasswordRepoImpl>()));
      case Routes.unitDetailsView:
        return transition(screen: const UnitDetailsView(),
            cubit: UnitDetailsCubit(getIt.get<UnitDetailsRepoImpl>()));
        default:
        return null;
    }
  }


  List<Widget> screens = [
    BlocProvider(
        create: (context)=>HomeCubit(getIt.get<HomeRepoImpl>()),
        child: HomeView()),
    SearchView(),
    Text("1"),
    BlocProvider(
        create: (context)=>ChatsCubit(getIt.get<ChatsRepoImpl>()),
        child: ChatsView()),
    ProfileView(),

  ];
}
