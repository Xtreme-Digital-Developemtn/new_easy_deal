import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - الألوان الأساسية
  static const primaryDark = Color(0xff0C3BB6);
  static const primaryMain = Color(0xff0C3BB6);
  static const primaryLight = Color(0xff4074FF);
  static const primaryVeryLight = Color(0x1A006638);

  // Neutral Colors - الألوان المحايدة
  static const black = Color(0xff000000);
  static const textDark = Color(0xff151515);
  static const textPrimary = Color(0xff272727);
  static const textSecondary = Color(0xff383838);
  static const textTertiary = Color(0xff4A4A4A);

  static const grayDarkest = Color(0xff5C5C5C);
  static const grayDarker = Color(0xff6E6E6E);
  static const grayDark = Color(0xff808080);
  static const grayMedium = Color(0xff919191);
  static const gray = Color(0xffA3A3A3);
  static const grayLight = Color(0xffBABABA);
  static const grayLighter = Color(0xffC7C7C7);
  static const grayLightest = Color(0xffD8D8D8);
  static const backgroundLight = Color(0xffEFEFEF);
  static const white = Color(0xffffffff);

  // Blue Colors - الألوان الزرقاء
  static const blueLight = Color(0xffD5E0FC);
  static const blueVeryLight = Color(0xffE7EBF8);

  // Status Colors - ألوان الحالة
  // Red - للخطأ والتحذير
  static const errorLight = Color(0xffFB3748);
  static const errorDark = Color(0xffD00416);
  static const errorVeryLight = Color(0x1AFB3748);

  // Yellow - للتحذيرات
  static const warningLight = Color(0xffFFDB43);
  static const warningDark = Color(0xffDFB400);
  static const warningVeryLight = Color(0x1AFFDB43);

  // Green - للنجاح
  static const successLight = Color(0xff84EBB4);
  static const successDark = Color(0xff1FC16B);
  static const successVeryLight = Color(0x1A1FC16B);

  // Other Colors
  static const divider = Color(0xff92929D);
  static const scaffoldBackground = Color(0xffffffff);

  // Transparent Colors
  static Color shadowLight = const Color(0xff030303).withValues(alpha: 0.1);
}