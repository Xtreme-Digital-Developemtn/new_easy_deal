import 'package:easy_localization/easy_localization.dart';

/// تنسيق الأرقام بأرقام اللغة الحالية — العربي بيطلع بأرقام عربية (٥٠٠)
/// والإنجليزي بأرقام لاتينية (500)، وفي الحالتين الآلاف بتتفصل بالفاصل
/// الخاص باللغة.
///
/// `intl` فيه رموز الأرقام لكل لغة جوه الحزمة، فـ `NumberFormat` بياخد
/// الـ languageCode على طول من غير تحميل بيانات زيادة.
abstract class NumberLocalization {
  /// بيرجّع الرقم منسّق بلغة `languageCode`. الأرقام الصحيحة بتطلع من غير
  /// كسور، واللي فيها كسور بتتقصّر على خانتين.
  /// `ar` في حزمة `intl` بياخذ أرقام لاتينية (123) افتراضياً، لذا نستخدم
  /// `ar_EG` (أرقام عربية ١٢٣) عندما تكون لغة التطبيق عربية.
  static String _effectiveLocale(String languageCode) {
    if (languageCode == 'ar' || languageCode.startsWith('ar_') && languageCode != 'ar_EG') {
      // نبقي ar_EG (الأرقام العربية) لجميع متغيرات العربية
      return 'ar_EG';
    }
    return languageCode.isEmpty ? 'en' : languageCode;
  }

  static String format(num value, String languageCode) {
    final isWhole = value % 1 == 0;
    final locale = _effectiveLocale(languageCode);
    return NumberFormat(
      isWhole ? '#,###' : '#,###.##',
      locale,
    ).format(value);
  }

  /// نفس `format` بس بتاخد أي قيمة جاية من الـ API (رقم أو نص)، ولو مش
  /// قابلة للتحويل لرقم بترجّعها زي ما هي بدل ما ترمي exception.
  static String formatDynamic(dynamic value, String languageCode) {
    if (value == null) return '';
    final number = num.tryParse(value.toString().trim());
    if (number == null) return value.toString();
    return format(number, languageCode);
  }
}
