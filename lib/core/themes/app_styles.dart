import '../../main_imports.dart';

class AppStyles {

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;

  static TextStyle _createStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static final TextStyle black16SemiBold = _createStyle(
    fontSize: 16.sp,
    fontWeight: semiBold,
    color: AppColors.black,
  );

  static final TextStyle black16Medium = _createStyle(
    fontSize: 16.sp,
    fontWeight: medium,
    color: AppColors.black,
  );


  static final TextStyle black14Medium = _createStyle(
    fontSize: 14.sp,
    fontWeight: medium,
    color: AppColors.black,
  );

  static final TextStyle primary14Medium = _createStyle(
    fontSize: 14.sp,
    fontWeight: medium,
    color: AppColors.primaryDark,
  );

  static final TextStyle primary16Medium = _createStyle(
    fontSize: 16.sp,
    fontWeight: medium,
    color: AppColors.primaryDark,
  );

  static final TextStyle primary16SemiBold = _createStyle(
    fontSize: 16.sp,
    fontWeight: semiBold,
    color: AppColors.primaryDark,
  );

  static final TextStyle black14Regular = _createStyle(
    fontSize: 14.sp,
    fontWeight: regular,
    color: AppColors.black,
  );

  static final TextStyle black20Bold = _createStyle(
    fontSize: 20.sp,
    fontWeight: bold,
    color: AppColors.black,
  );

}