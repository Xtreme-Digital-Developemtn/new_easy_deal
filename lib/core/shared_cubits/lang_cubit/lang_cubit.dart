import 'package:easy_localization/easy_localization.dart';

import '../../../main_imports.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(_getSavedLocale());

  static Locale _getSavedLocale() {
    return const Locale('ar', '');
  }

  void changeLanguage(BuildContext context, Locale locale) {
    CacheHelper.saveData(key: StorageKeys.language, value: locale.languageCode);
    EasyLocalization.of(context)?.setLocale(locale);
    emit(locale);
  }
}