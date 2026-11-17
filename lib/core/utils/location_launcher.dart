import 'package:url_launcher/url_launcher.dart';

/// بيفتح موقع الوحدة في خرائط جوجل.
///
/// الحقل `location` بيتخزّن كرابط (الفورم نفسه بيتحقق إنه URL)، وكان بيتبعت
/// كـ *نص بحث* جوه رابط خرائط جوجل، يعني كانت بتدوّر على الرابط نفسه بدل ما
/// تفتحه. دلوقتي: لو القيمة رابط بنفتحه زي ما هو، وغير كده بنعاملها كعنوان
/// نصّي ونبحث عنه.
///
/// بترجّع false لو مافيش قيمة أو لو الجهاز مش قادر يفتح الرابط، عشان الشاشة
/// تقدر تعرض رسالة بدل ما مايحصلش حاجة بالصمت.
Future<bool> openLocationInMaps(String? location) async {
  final value = location?.trim() ?? '';
  if (value.isEmpty) return false;

  final parsed = Uri.tryParse(value);
  final isUrl = parsed != null &&
      parsed.hasScheme &&
      (parsed.scheme == 'http' || parsed.scheme == 'https');

  final uri = isUrl
      ? parsed
      : Uri.parse(
          'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(value)}',
        );

  try {
    if (await canLaunchUrl(uri)) {
      return launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  } catch (_) {}
  return false;
}
