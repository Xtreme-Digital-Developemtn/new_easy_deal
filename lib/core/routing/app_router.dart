

 import 'package:easy_deal/features/category_units/data/repos/category_units_repo_imple.dart';
import 'package:easy_deal/features/change_password/presentation/views/change_password_view.dart';
import 'package:easy_deal/features/edit_profile/data/repos/edit_profile_repo_imple.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/edit_advertisement_properties_view.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/edit_email.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/edit_profile_view.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/edit_registration_papers_view.dart';
import 'package:easy_deal/features/home/data/repos/home_repo_imple.dart';
import 'package:easy_deal/features/home/presentation/views/home_view.dart';
 import 'package:easy_deal/features/layout/presentation/views/layout_view.dart';
import 'package:easy_deal/features/login/data/repos/login_repo_imple.dart';
import 'package:easy_deal/features/login/presentation/view_model/login_cubit.dart';
import 'package:easy_deal/features/login/presentation/views/login_view.dart';
import 'package:easy_deal/features/onbaording/presentation/views/onboarding_view.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/features/register/presentation/views/register_view.dart';
import 'package:easy_deal/features/search/presentation/views/search_view.dart';

import '../../features/about_us/data/repos/about_us_repo_imple.dart';
import '../../features/about_us/presentation/view_model/about_us_cubit.dart';
import '../../features/about_us/presentation/views/about_us_view.dart';
import '../../features/assign_to_broker/data/repos/assign_to_broker_repo_imple.dart';
import '../../features/assign_to_broker/presentation/view_model/assign_to_broker_cubit.dart';
import '../../features/assign_to_broker/presentation/views/assign_to_broker_view.dart';
import '../../features/assign_to_broker/presentation/views/success_assign_view.dart';
import '../../features/broker_features/boker_data/data/repos/broker_data_repo_imple.dart';
import '../../features/broker_features/boker_data/presentation/view_model/broker_data_cubit.dart';
import '../../features/broker_features/boker_data/presentation/views/broker_data_view.dart';
import '../../features/broker_features/broker_developers/data/repos/broker_developers_repo_imple.dart';
import '../../features/broker_features/broker_developers/presentation/view_model/broker_developers_cubit.dart';
import '../../features/broker_features/broker_developers/presentation/views/broker_developers_view.dart';
import '../../features/broker_features/broker_home/data/repos/broker_home_repo_imple.dart';
import '../../features/broker_features/broker_home/presentation/view_model/broker_home_cubit.dart';
import '../../features/broker_features/broker_home/presentation/views/broker_home_view.dart';
import '../../features/category_units/presentation/view_model/category_units_cubit.dart';
import '../../features/category_units/presentation/views/category_units_view.dart';
import '../../features/change_password/data/repos/change_password_repo_imple.dart';
import '../../features/change_password/presentation/view_model/change_password_cubit.dart';
import '../../features/chats/data/repos/chats_repo_imple.dart';
import '../../features/chats/presentation/view_model/chats_cubit.dart';
import '../../features/chats/presentation/views/chats_view.dart';
import '../../features/contact_us/data/repos/contact_us_repo_imple.dart';
import '../../features/contact_us/presentation/view_model/contact_us_cubit.dart';
import '../../features/contact_us/presentation/views/contact_us_view.dart';
import '../../features/create_request/data/models/category_model.dart';
import '../../features/create_request/data/repos/create_request_repo_imple.dart';
import '../../features/create_request/presentation/view_model/create_request_cubit.dart';
import '../../features/create_request/presentation/views/create_request_view.dart';
import '../../features/create_request/presentation/views/create_request_by_category_view.dart';
import '../../features/faqs/data/repos/faqs_repo_imple.dart';
import '../../features/faqs/presentation/view_model/faqs_cubit.dart';
import '../../features/faqs/presentation/views/faqs_view.dart';
import '../../features/home/presentation/view_model/home_cubit.dart';
import '../../features/notifications/data/repos/notifications_repo_imple.dart';
import '../../features/notifications/presentation/view_model/notifications_cubit.dart';
import '../../features/notifications/presentation/views/notifications_view.dart';

import '../../features/otp/data/repos/otp_repo_imple.dart';
import '../../features/otp/presentation/view_model/otp_cubit.dart';
import '../../features/otp/presentation/views/otp_view.dart';
import '../../features/privacy_terms/data/repos/privacy_terms_repo_imple.dart';
import '../../features/privacy_terms/presentation/view_model/privacy_terms_cubit.dart';
import '../../features/privacy_terms/presentation/views/privacy_terms_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/register/data/repos/register_repo_imple.dart';
import '../../features/register/presentation/view_model/register_cubit.dart';
import '../../features/report_issue/data/repos/report_issue_repo_imple.dart';
import '../../features/report_issue/presentation/view_model/report_issue_cubit.dart';
import '../../features/report_issue/presentation/views/report_issue_view.dart';
import '../../features/request_details/presentation/views/request_details_view.dart';
import '../../features/requests/data/repos/requests_repo_imple.dart';
import '../../features/requests/presentation/view_model/requests_cubit.dart';
import '../../features/requests/presentation/views/requests_view.dart';
import '../../features/search/data/repos/search_repo_imple.dart';
import '../../features/search/presentation/view_model/search_cubit.dart';
import '../../features/settings/data/repos/app_settings_repo_imple.dart';
import '../../features/settings/presentation/view_model/settings_cubit.dart';
import '../../features/settings/presentation/views/settings_view.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/success/presentation/views/success_view.dart';
import '../../features/unit_details/data/repos/unit_details_repo_imple.dart';
import '../../features/unit_details/presentation/view_model/unit_details_cubit.dart';
import '../../features/unit_details/presentation/views/unit_details_view.dart';
import '../../features/upload_broker_doc/data/repos/upload_broker_doc_repo_imple.dart';
import '../../features/upload_broker_doc/presentation/view_model/upload_broker_doc_cubit.dart';
import '../../features/upload_broker_doc/presentation/views/upload_broker_doc_view.dart';
import '../../features/user_chat/data/repos/user_repo_imple.dart';
import '../../features/user_chat/presentation/view_model/user_chat_cubit.dart';
import '../../features/user_chat/presentation/views/user_chat_view.dart';
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
          selectIndex: args["selectIndex"] as int,
        ),cubit: OtpCubit(getIt.get<OtpRepoImpl>()));
      case Routes.changePasswordView:
        return transition(screen: const ChangePasswordView(),
            cubit: ChangePasswordCubit(getIt.get<ChangePasswordRepoImpl>()));
      case Routes.aboutUsView:
        return transition(screen: const AboutUsView(),
            cubit: AboutUsCubit(getIt.get<AboutUsRepoImpl>()));
      case Routes.unitDetailsView:
        return transition(screen: const UnitDetailsView(),
            cubit: UnitDetailsCubit(getIt.get<UnitDetailsRepoImpl>()));
      case Routes.userChatView:
        return transition(screen: const UserChatView(),
            cubit: UserChatCubit(getIt.get<UserChatRepoImpl>()));
      case Routes.reportIssueView:
        return transition(screen: const ReportIssueView(),
            cubit: ReportIssueCubit(getIt.get<ReportIssueRepoImpl>()));
      case Routes.privacyTermsView:
        return transition(screen: const PrivacyTermsView(),
            cubit: PrivacyTermsCubit(getIt.get<PrivacyTermsRepoImpl>()));
      case Routes.faqsView:
        return transition(screen: const FAQsView(),
            cubit: FAQsCubit(getIt.get<FAQsRepoImpl>()));
      case Routes.contactUsView:
        return transition(screen: const ContactUsView(),
            cubit: ContactUsCubit(getIt.get<ContactUsRepoImpl>()));
      case Routes.appSettingsView:
        return transition(screen: const AppSettingsView(),
            cubit: AppSettingsCubit(getIt.get<AppSettingsRepoImpl>()));
      case Routes.onBoardingView:
        return transition(screen: const OnboardingView());
      case Routes.registerView:
        return transition(screen: const RegisterView(),
            cubit: RegisterCubit(getIt.get<RegisterRepoImpl>()));
      case Routes.successView:
        return transition(screen: const SuccessView(),);
      case Routes.uploadBrokerDocView:
        final args = arguments as Map<String, dynamic>;
        return transition(screen:   UploadBrokerDocView(selectedIndex: args["selectIndex"] as int,),
            cubit: UploadBrokerDocCubit(getIt.get<UploadBrokerDocRepoImpl>(),),
        );
      case Routes.createRequestView:
        return transition(screen: const CreateRequestView(),
            cubit: CreateRequestCubit(getIt.get<CreateRequestRepoImpl>()));
      case Routes.createRequestByCategoryView:
        final args = arguments as Map<String, dynamic>;
        final createRequestCubit = args['cubit'] as CreateRequestCubit;
        final category = args['category'] as CategoryModel;

        return transition(
          screen: BlocProvider.value(
            value: createRequestCubit,
            child: CreateRequestByCategoryView(category: category),
          ),
        );
      case Routes.assignToBrokerView:
        return transition(screen: const AssignToBrokerView(),
            cubit: AssignToBrokerCubit(getIt.get<AssignToBrokerRepoImpl>()));
      case Routes.successAssignView:
        return transition(screen: const SuccessAssignView());
      case Routes.requestDetailsView:
        return transition(screen: const RequestDetailsView());
      case Routes.brokerHomeView:
        return transition(screen: const BrokerHomeView(),
            cubit: BrokerHomeCubit(getIt.get<BrokerHomeRepoImpl>()));
      case Routes.editAdvertisementAndPropertyDetailsView:
        final args = arguments as Map<String, dynamic>;
        final profileCubit = args['profileCubit'] as ProfileCubit;
        return transition(
          screen: BlocProvider.value(
            value: profileCubit,
            child: EditAdvertisementAndPropertyDetailsView(),
          ),
        );
      case Routes.editRegistrationPapersView:
        final args = arguments as Map<String, dynamic>;
        final editProfileCubit = args['editProfileCubit'] as EditProfileCubit;
        return transition(
          screen: BlocProvider.value(
            value: editProfileCubit,
            child: EditRegistrationPapersView(),
          ),
        );
      case Routes.brokerDevelopersView:
        return transition(screen: const BrokerDevelopersView(),
            cubit: BrokerDevelopersCubit(getIt.get<BrokerDevelopersRepoImpl>()));
      case Routes.brokerDataView:
        return transition(screen: const BrokerDataView(),
            cubit: BrokerDataCubit(getIt.get<BrokerDataRepoImpl>()));
        default:
        return null;
    }
  }


  List<Widget> screens = [
    CacheHelper.getData(key: "role")=="client" ?
    BlocProvider(
        create: (context)=>HomeCubit(getIt.get<HomeRepoImpl>()),
        child: HomeView()) : BlocProvider(
        create: (context)=>BrokerHomeCubit(getIt.get<BrokerHomeRepoImpl>()),
        child: BrokerHomeView()),
    SearchView(),
    BlocProvider(
        create: (context)=>RequestsCubit(getIt.get<RequestsRepoImpl>()),
        child: RequestsView()),
    BlocProvider(
        create: (context)=>ChatsCubit(getIt.get<ChatsRepoImpl>()),
        child: ChatsView()),
    ProfileView(),

  ];
}
