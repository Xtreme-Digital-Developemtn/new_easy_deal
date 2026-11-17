import '../../../main_imports.dart';
import '../../utils/app_consts/session_cache.dart';
import 'auth_states.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool isGuest = false;
  String? userToken;

  void checkAuthStatus() {
    // التوكن الحقيقي في الـ secure storage جوه CacheTokenManger، فقراءته
    // من SharedPreferences كانت بترجّع null دايماً.
    userToken = CacheTokenManger.userToken ??
        CacheHelper.getData(key: StorageKeys.userToken);
    isGuest = CacheHelper.getData(key: StorageKeys.isGuest) ?? false;

    if (isGuest) {
      emit(AuthGuestState());
    } else if (userToken != null) {
      emit(AuthLoggedInState());
    } else {
      emit(AuthLoggedOutState());
    }
  }

  void loginAsGuest() {
    isGuest = true;
    userToken = null;
    CacheHelper.saveData(key: StorageKeys.isGuest, value: true);
    CacheHelper.removeData(key: StorageKeys.userToken);
    emit(AuthGuestState());
  }

  void loginWithToken(String token) {
    isGuest = false;
    // كان مكتوب `userToken = userToken;` يعني الباراميتر بيتسند لنفسه
    // والحقل يفضل null.
    userToken = token;
    CacheHelper.saveData(key: StorageKeys.isGuest, value: false);
    CacheHelper.saveData(key: StorageKeys.userToken, value: token);
    emit(AuthLoggedInState());
  }

  void logout() {
    isGuest = false;
    userToken = null;
    CacheHelper.removeData(key: StorageKeys.userToken);
    CacheHelper.removeData(key: StorageKeys.isGuest);
    SessionCache.clear();
    emit(AuthLoggedOutState());
  }
}
