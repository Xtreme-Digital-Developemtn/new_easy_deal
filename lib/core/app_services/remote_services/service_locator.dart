
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../../features/home/data/repos/home_repo_imple.dart';
import '../../../features/login/data/repos/login_repo_imple.dart';
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
}