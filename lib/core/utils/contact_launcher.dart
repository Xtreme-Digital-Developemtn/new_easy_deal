import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../lang/lang_keys.dart';

/// مكان واحد لفتح الاتصال والواتساب، عشان صيغة الرقم والتعامل مع
/// الرقم الناقص يبقوا متطابقين في كل الشاشات.
class ContactLauncher {
  const ContactLauncher._();

  /// أرقام فقط، من غير مسافات ولا رموز.
  static String _digitsOnly(String raw) => raw.replaceAll(RegExp(r'[^0-9]'), '');

  /// هل الرقم صالح للاستخدام أصلًا؟
  static bool hasPhone(String? raw) =>
      raw != null && _digitsOnly(raw).isNotEmpty;

  /// الصيغة الدولية المصرية: الصفر الأول **يتحوّل** لـ 20 (مش يتحط قبله).
  /// 01012345678 -> 201012345678
  /// 00201012345678 / +201012345678 -> 201012345678
  /// 1012345678 -> 201012345678
  static String? internationalPhone(String? raw) {
    if (raw == null) return null;
    var phone = _digitsOnly(raw);
    if (phone.isEmpty) return null;

    if (phone.startsWith('00')) {
      phone = phone.substring(2);
    }
    if (phone.startsWith('20')) {
      return phone;
    }
    if (phone.startsWith('0')) {
      return '20${phone.substring(1)}';
    }
    // رقم محلي من غير الصفر البادئ (10 أرقام تبدأ بـ 1)
    if (phone.startsWith('1') && phone.length == 10) {
      return '20$phone';
    }
    return phone;
  }

  static void _notify(BuildContext context, String message) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  /// يفتح شاشة الاتصال برقم الوسيط، أو يعرض رسالة لو مفيش رقم.
  static Future<void> call(BuildContext context, String? rawPhone) async {
    if (!hasPhone(rawPhone)) {
      _notify(context, LangKeys.brokerPhoneNotAvailable.tr());
      return;
    }
    // الاتصال بيشتغل بالرقم زي ما هو، مع الحفاظ على + لو موجودة
    final trimmed = rawPhone!.trim();
    final dialable = trimmed.startsWith('+')
        ? '+${_digitsOnly(trimmed)}'
        : _digitsOnly(trimmed);
    final uri = Uri(scheme: 'tel', path: dialable);
    try {
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        _notify(context, LangKeys.cannotOpenDialer.tr());
      }
    } catch (e) {
      debugPrint('Call error: $e');
      _notify(context, LangKeys.cannotOpenDialer.tr());
    }
  }

  /// يفتح محادثة واتساب مع رقم الوسيط بالصيغة الدولية.
  /// لو الواتساب مش متثبّت، wa.me بيفتح في المتصفح؛ ولو ده كمان مش متاح
  /// بتظهر رسالة — من غير أي كراش.
  static Future<void> whatsApp(BuildContext context, String? rawPhone) async {
    final phone = internationalPhone(rawPhone);
    if (phone == null) {
      _notify(context, LangKeys.brokerPhoneNotAvailable.tr());
      return;
    }
    final uri = Uri.parse('https://wa.me/$phone');
    try {
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        _notify(context, LangKeys.cannotOpenWhatsApp.tr());
      }
    } catch (e) {
      debugPrint('WhatsApp error: $e');
      _notify(context, LangKeys.cannotOpenWhatsApp.tr());
    }
  }
}
