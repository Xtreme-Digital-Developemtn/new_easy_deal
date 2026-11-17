import '../../app_services/local_services/cache_helper.dart';
import 'storage_keys.dart';

/// هوية المستخدم المخزّنة في SharedPreferences (id / دور / brokerId ...).
///
/// تسجيل الخروج كان بيمسح التوكن بس، فالمفاتيح دي كانت بتفضل من الأكونت
/// القديم. وكمان `brokerId` بييجي null لحساب العميل، وحفظ null كان بيفشل
/// بالصمت فيفضل id الوسيط السابق مكانه. الكلاس ده المكان الوحيد اللي بيعرف
/// مفاتيح الجلسة، بيتنادى عند الخروج وقبل أي دخول/تسجيل جديد.
class SessionCache {
  const SessionCache._();

  static const userRoleKey = 'userRole';
  static const clientIdKey = 'clientId';

  static const _keys = <String>[
    StorageKeys.userId,
    StorageKeys.brokerId,
    StorageKeys.userEmail,
    StorageKeys.userPhone,
    StorageKeys.userName,
    StorageKeys.userFirstName,
    StorageKeys.userLastName,
    userRoleKey,
    clientIdKey,
  ];

  static Future<void> clear() async {
    for (final key in _keys) {
      await CacheHelper.removeData(key: key);
    }
  }

  /// id المستخدم الحالي، أو null لو مفيش جلسة.
  static int? get userId =>
      int.tryParse(CacheHelper.getData(key: StorageKeys.userId)?.toString() ?? '');

  static int? get brokerId =>
      int.tryParse(CacheHelper.getData(key: StorageKeys.brokerId)?.toString() ?? '');

  /// الدور كما رجع من السيرفر، من غير حساسية لحالة الأحرف أو المسافات.
  static String get role =>
      (CacheHelper.getData(key: userRoleKey)?.toString() ?? '').trim().toLowerCase();

  static bool get isBroker => role == 'broker';
}
