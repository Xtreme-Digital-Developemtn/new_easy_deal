 //
import 'package:easy_localization/easy_localization.dart';

import '../../../lang/lang_keys.dart';

class AppValidators {
  static String? displayNameValidator(String? displayName) {
    if (displayName == null || displayName
        .trim()
        .isEmpty) {
      return LangKeys.nameValidate; // "Name is required"
    }

    final trimmed = displayName.trim();

    if (trimmed.length < 2) {
      return LangKeys.nameTooShort; // "Name must be at least 2 characters"
    }

    if (trimmed.length > 50) {
      return LangKeys.nameTooLong; // "Name cannot exceed 50 characters"
    }

    if (RegExp(r'[0-9]').hasMatch(trimmed)) {
      return LangKeys.nameNoNumbers; // "Name cannot contain numbers"
    }

    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(trimmed)) {
      return LangKeys
          .nameNoSpecialChars; // "Name cannot contain special characters"
    }

    return null;
  }

//   static String? displayMessageValidator(String? message) {
//     if (message == null || message.isEmpty) {
//       return LangKeys.messageValidate; // "Message is required"
//     }
//
//     if (message.length < 10) {
//       return AppStrings.messageTooShort; // "Message must be at least 10 characters"
//     }
//
//     if (message.length > 500) {
//       return AppStrings.messageTooLong; // "Message cannot exceed 500 characters"
//     }
//
//     return null;
//   }
//
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LangKeys.emailValidate.tr();
    }

    final emailRegex = RegExp(
        r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$'
    );

    if (!emailRegex.hasMatch(value)) {
      return LangKeys.emailValidate2.tr(); // "Please enter a valid email"
    }

    // Additional checks for common email issues
    if (value.contains(' ')) {
      return LangKeys.emailNoSpaces.tr(); // "Email cannot contain spaces"
    }

    if (value.startsWith('.') || value.endsWith('.')) {
      return LangKeys.emailInvalidDots.tr();// "Email cannot start or end with a dot"
    }

    if ('@.'.allMatches(value).length > 1) {
      return LangKeys.emailMultipleAt.tr();// "Email can only contain one @ symbol"
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LangKeys.passwordValidate.tr(); // "Password is required"
    }

    // Detailed password requirements
    final requirements = <String>[];

    if (value.length < 8) {
      requirements.add(
          LangKeys.passwordMinLength.tr()); // "8 characters minimum"
    }

    if (value.length > 30) {
      requirements.add(
          LangKeys.passwordMaxLength.tr()); // "30 characters maximum"
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      requirements.add(
          LangKeys.passwordRequireUppercase.tr()); // "1 uppercase letter"
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      requirements.add(
          LangKeys.passwordRequireLowercase.tr()); // "1 lowercase letter"
    }

    if (!RegExp(r'\d').hasMatch(value)) {
      requirements.add(LangKeys.passwordRequireNumber.tr()); // "1 number"
    }

    // if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    //   requirements.add(LangKeys.passwordRequireSpecial.tr()); // "1 special character"
    // }

    if (requirements.isNotEmpty) {
      return '${LangKeys.passwordRequirements.tr()}:\n${requirements.join(
          '\n')}';
    }

    return null;
  }

//   static String? urlValidator(String? value, {bool isRequired = false}) {
//     if (isRequired && (value == null || value.isEmpty)) {
//       return AppStrings.urlRequired; // "URL is required"
//     }
//
//     if (value == null || value.isEmpty) {
//       return null;
//     }
//
//     final urlRegex = RegExp(
//         r'^(https?://)?' // http:// or https://
//         r'([\w-]+\.)+[\w-]+' // Domain
//         r'(:\d+)?' // Port
//         r'(/[\w-./?%&=]*)?$' // Path and query
//     );
//
//     if (!urlRegex.hasMatch(value)) {
//       return AppStrings.urlInvalid; // "Please enter a valid URL"
//     }
//
//     if (!value.startsWith('http://') && !value.startsWith('https://')) {
//       return AppStrings.urlMissingProtocol; // "URL must start with http:// or https://"
//     }
//
//     return null;
//   }

  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value == null || value.isEmpty) {
      return LangKeys.repeatPasswordRequired
          .tr(); // "Please repeat your password"
    }

    if (password == null || password.isEmpty) {
      return LangKeys.enterPasswordFirst
          .tr(); // "Please enter your password first"
    }

    if (value != password) {
      return LangKeys.passwordsDontMatch.tr(); // "Passwords don't match"
    }

    return null;
  }

  static String? phoneValidator(String? value, {String? countryCode}) {
    if (value == null || value.trim().isEmpty) {
      return LangKeys.phoneRequired.tr();
    }

    final numeric = value.replaceAll(RegExp(r'\D'), '');
    if (numeric.isEmpty) return LangKeys.phoneRequired.tr();

    /// خارطة تشمل أكثر من 100 دولة
    /// كل دولة = طول رقم الهاتف + regex اختياري
    final Map<String, RegExp> rules = {
      // الشرق الأوسط
      '+20': RegExp(r'^01[0-2,5]{1}[0-9]{8}$'), // مصر (11 رقم)
      '+966': RegExp(r'^5[0-9]{8}$'),          // السعودية (9)
      '+971': RegExp(r'^5[0-9]{8}$'),          // الإمارات (9)
      '+965': RegExp(r'^[0-9]{8}$'),           // الكويت (8)
      '+974': RegExp(r'^[3-6][0-9]{7}$'),      // قطر (8)
      '+973': RegExp(r'^[3-9][0-9]{7}$'),      // البحرين (8)
      '+962': RegExp(r'^7[0-9]{8}$'),          // الأردن (9)
      '+964': RegExp(r'^7[3-9][0-9]{8}$'),     // العراق (10)
      '+963': RegExp(r'^[9][0-9]{8}$'),        // سوريا (9)
      '+961': RegExp(r'^[3-9][0-9]{6,7}$'),    // لبنان (7-8)
      '+970': RegExp(r'^5[0-9]{8}$'),          // فلسطين (9)

      // أفريقيا
      '+212': RegExp(r'^[5-7][0-9]{8,9}$'),     // المغرب (9-10)
      '+213': RegExp(r'^[5-7][0-9]{8}$'),       // الجزائر (9)
      '+216': RegExp(r'^[2-9][0-9]{7}$'),       // تونس (8)
      '+218': RegExp(r'^[9][0-9]{8}$'),         // ليبيا (9)
      '+254': RegExp(r'^[7][0-9]{8}$'),         // كينيا (9)
      '+256': RegExp(r'^[7][0-9]{8}$'),         // أوغندا (9)
      '+251': RegExp(r'^[9][0-9]{8}$'),         // إثيوبيا (9)
      '+250': RegExp(r'^[7][0-9]{7}$'),         // رواندا (8)
      '+244': RegExp(r'^[0-9]{9}$'),            // أنجولا (9)
      '+233': RegExp(r'^[2-5][0-9]{8}$'),       // غانا (9)
      '+234': RegExp(r'^[7-9][0-9]{9}$'),       // نيجيريا (10)
      '+27': RegExp(r'^[6-8][0-9]{8}$'),        // جنوب أفريقيا (9)

      // أوروبا
      '+44': RegExp(r'^[0-9]{10,11}$'),         // بريطانيا
      '+33': RegExp(r'^[0-9]{9}$'),             // فرنسا
      '+49': RegExp(r'^[0-9]{10,11}$'),         // ألمانيا
      '+39': RegExp(r'^[0-9]{8,10}$'),          // إيطاليا
      '+34': RegExp(r'^[0-9]{9}$'),             // إسبانيا
      '+31': RegExp(r'^[0-9]{9}$'),             // هولندا
      '+32': RegExp(r'^[4][0-9]{8}$'),          // بلجيكا
      '+30': RegExp(r'^[6-9][0-9]{9}$'),        // اليونان
      '+351': RegExp(r'^[9][0-9]{8}$'),         // البرتغال
      '+359': RegExp(r'^[8-9][0-9]{7,8}$'),     // بلغاريا
      '+40': RegExp(r'^[7][0-9]{8}$'),          // رومانيا
      '+36': RegExp(r'^[2-9][0-9]{8}$'),        // المجر
      '+380': RegExp(r'^[3-9][0-9]{8}$'),       // أوكرانيا

      // آسيا
      '+90': RegExp(r'^[5][0-9]{9}$'),          // تركيا
      '+98': RegExp(r'^[9][0-9]{9}$'),          // إيران
      '+92': RegExp(r'^[3][0-9]{9}$'),          // باكستان
      '+91': RegExp(r'^[6-9][0-9]{9}$'),        // الهند
      '+94': RegExp(r'^[7][0-9]{8}$'),          // سريلانكا
      '+60': RegExp(r'^[1-9][0-9]{7,9}$'),      // ماليزيا
      '+62': RegExp(r'^[8][0-9]{8,10}$'),       // إندونيسيا
      '+63': RegExp(r'^[9][0-9]{9}$'),          // الفلبين
      '+81': RegExp(r'^[7-9][0-9]{8,9}$'),      // اليابان
      '+82': RegExp(r'^[1][0-9]{7,8}$'),        // كوريا الجنوبية
      '+86': RegExp(r'^[1][0-9]{10}$'),         // الصين

      // الأمريكتين
      '+1': RegExp(r'^[0-9]{10}$'),             // أمريكا + كندا
      '+52': RegExp(r'^[0-9]{10}$'),            // المكسيك
      '+55': RegExp(r'^[0-9]{10,11}$'),         // البرازيل
      '+54': RegExp(r'^[0-9]{10}$'),            // الأرجنتين
      '+57': RegExp(r'^[3][0-9]{9}$'),          // كولومبيا
      '+58': RegExp(r'^[4][0-9]{9}$'),          // فنزويلا
      '+56': RegExp(r'^[9][0-9]{8}$'),          // تشيلي

      // أستراليا
      '+61': RegExp(r'^[4][0-9]{8}$'),          // أستراليا
      '+64': RegExp(r'^[2][0-9]{7,9}$'),        // نيوزيلندا
    };

    // معالجة مصر بشكل خاص
    if (countryCode == '+20') {
      String num = numeric;
      if (num.length == 10 && num.startsWith('1')) {
        num = '0$num';
      }
      if (!rules['+20']!.hasMatch(num)) {
        return LangKeys.phoneEgyptInvalid.tr();
      }
      return null;
    }

    // لو الدولة موجودة في الخريطة
    if (rules.containsKey(countryCode)) {
      if (!rules[countryCode]!.hasMatch(numeric)) {
        return LangKeys.phoneInternationalInvalid.tr();
      }
      return null;
    }

    // fallback عالمي
    if (numeric.length < 7 || numeric.length > 15) {
      return LangKeys.phoneInternationalInvalid.tr();
    }

    return null;
  }
}