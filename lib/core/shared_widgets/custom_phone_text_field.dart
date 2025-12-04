import 'package:easy_localization/easy_localization.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../main_imports.dart';

class CustomPhoneTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final bool? obscureText;
  final bool? autofocus;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final bool? readOnly;
  final bool? showCursor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final bool isChat;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<PhoneNumber>? onChanged;
  final String? Function(PhoneNumber?)? validator;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enabled;
  final Iterable<String>? autofillHints;
  final EdgeInsets? contentPadding;
  final EdgeInsets? padding;
  final bool? expands;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final VoidCallback? onTap;
  final double borderRadius;
  final Color? backgroundColor;
  final Color borderColor;
  final double? borderWidth;
  final double? height;
  final TextAlign? textAlign;
  final ValueChanged<Country>? onCountry;
  final double? width;
  final TextAlignVertical? textAlignVertical;
  final FocusNode? focusNode;
  final String? initialCountryCode;

  const CustomPhoneTextFormField(
      {super.key,
      this.controller,
      this.isChat = false,
      this.textAlign,
      this.padding,
      this.textStyle,
      this.hintStyle,
      this.hintText,
      this.width,
      this.labelText,
      this.backgroundColor,
      this.helperText,
      this.borderColor = AppColors.blueLight,
      this.borderWidth,
      this.errorText,
      this.obscureText = false,
      this.autofocus = false,
      this.autocorrect = true,
      this.enableSuggestions = true,
      this.readOnly = false,
      this.showCursor,
      this.maxLength,
      this.keyboardType,
      this.textInputAction,
      this.onChanged,
      this.validator,
      this.borderRadius = 10,
      this.onSaved,
      this.inputFormatters,
      this.prefixIcon,
      this.suffixIcon,
      this.enabled,
      this.autofillHints,
      this.contentPadding,
      this.expands,
      this.maxLines,
      this.minLines,
      this.onFieldSubmitted,
      this.buildCounter,
      this.scrollPhysics,
      this.onTap,
      this.height,
      this.textAlignVertical,
      this.focusNode,
      this.initialCountryCode,
      this.onCountry});

  @override
  Widget build(BuildContext context) {
    final isTall = height != null && height! >= 50.h;

    return IntlPhoneField(
      onCountryChanged: onCountry,
      languageCode: context.locale.languageCode,
      controller: controller,
      invalidNumberMessage: LangKeys.invalidPhoneNumber.tr(),
      style: textStyle,
      initialCountryCode: initialCountryCode ?? 'EG',
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(SvgImages.mobile,colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),),
        ),
        alignLabelWithHint: isTall,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              vertical: 17.h,
              horizontal: 15.w,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.blueLight),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth ?? 1.sp,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth ?? 1.sp,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Colors.red,
            width: borderWidth ?? 1.sp,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Colors.red,
            width: borderWidth ?? 1.sp,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth ?? 1.sp,
          ),
        ),
        labelText: labelText,
        hintStyle: hintStyle ?? TextStyle(color: AppColors.gray, fontSize: 14.sp  , fontWeight: FontWeight.w500),
        labelStyle:  TextStyle(color: AppColors.primaryDark, fontSize: 14.sp  , fontWeight: FontWeight.w500),
        hintText: hintText,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon,
        filled: true,
        // suffixIcon: suffixIcon,
        prefixIconColor: AppColors.primaryDark,
        suffixIconColor: AppColors.primaryDark,
        enabled: enabled ?? true,
        fillColor: backgroundColor ?? AppColors.scaffoldBackground,
      ),
      autofocus: autofocus!,
      readOnly: readOnly!,
      textInputAction: textInputAction,
      onChanged: onChanged,
      validator: validator,
      inputFormatters: inputFormatters,
      onTap: onTap,
    );
  }
}
