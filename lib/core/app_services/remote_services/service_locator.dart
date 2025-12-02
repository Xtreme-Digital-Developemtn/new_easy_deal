
import 'package:dio/dio.dart';
import 'package:easy_deal/features/change_password/data/repos/change_password_repo_imple.dart';
 import 'package:easy_deal/features/notifications/data/repos/notifications_repo_imple.dart';
 import 'package:easy_deal/features/otp/data/repos/otp_repo_imple.dart';
 import 'package:easy_deal/features/search/data/repos/search_repo_imple.dart';
 import 'package:get_it/get_it.dart';
import '../../../features/about_us/data/repos/about_us_repo_imple.dart';
import '../../../features/category_units/data/repos/category_units_repo_imple.dart';
import '../../../features/chats/data/repos/chats_repo_imple.dart';
import '../../../features/edit_profile/data/repos/edit_profile_repo_imple.dart';
import '../../../features/home/data/repos/home_repo_imple.dart';
import '../../../features/login/data/repos/login_repo_imple.dart';
import '../../../features/profile/data/repos/profile_repo_imple.dart';
import '../../../features/unit_details/data/repos/unit_details_repo_imple.dart';
import '../../../features/user_chat/data/repos/user_repo_imple.dart';
import 'api_service.dart';


final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<ProfileRepoImpl>(ProfileRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<EditProfileRepoImpl>(EditProfileRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<CategoryUnitsRepoImpl>(CategoryUnitsRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<NotificationsRepoImpl>(NotificationsRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<OtpRepoImpl>(OtpRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<ChangePasswordRepoImpl>(ChangePasswordRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<AboutUsRepoImpl>(AboutUsRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<UnitDetailsRepoImpl>(UnitDetailsRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<ChatsRepoImpl>(ChatsRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<UserChatRepoImpl>(UserChatRepoImpl(
    getIt.get<ApiService>(),
  ));


}