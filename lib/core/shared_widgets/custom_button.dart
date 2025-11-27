import 'package:easy_deal/core/themes/app_styles.dart';
import '../../main_imports.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? iconData;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final BorderSide? borderColor;
  final double? elevation;
  final bool? enableShadow;
  final bool? isEnabled;
  final bool? haveTextStyle;
  final TextStyle? textStyle;
  final bool? gradientColors;
  final List<BoxShadow>? boxShadow;

  const CustomButton({
    super.key,
    this.onPressed,
    this.textStyle,
    this.iconData,
    this.text,
    this.color,
    this.textColor,
    this.haveTextStyle = false,
    this.fontSize = 20,
    this.fontWeight,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.borderRadius = 8,
    this.borderColor,
    this.elevation = 0,
    this.enableShadow,
    this.isEnabled,
    this.gradientColors = true,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;

    return GestureDetector(
      onTap: onPressed,
      child: Opacity(
        opacity: isDisabled ? 0.6 : 1.0, // شفافية عندما يكون معطل
        child: Container(
          width: width ?? MediaQuery.of(context).size.width * 0.9,
          height: height ?? 50.h,
          margin: margin,
          padding: padding ?? EdgeInsets.symmetric(horizontal: 2.w),
          decoration: BoxDecoration(
            gradient: !isDisabled && gradientColors == true
                ? LinearGradient(
              colors: [AppColors.primaryDark, AppColors.primaryLight],
              end: Alignment.topRight,
              begin: Alignment.bottomLeft,
            )
                : null,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor?.color ?? Colors.transparent),
            color: isDisabled
                ? (color ?? Colors.grey) // لون عندما يكون معطل
                : color ?? AppColors.primaryDark,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      text!,
                      style: haveTextStyle == true
                          ? textStyle
                          : AppStyles.black14Medium.copyWith(
                        color: isDisabled
                            ? (textColor ?? Colors.grey.shade600)
                            : textColor ?? AppColors.scaffoldBackground,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                2.horizontalSpace,
                if (iconData != null) ...[
                  Icon(
                    iconData,
                    color: isDisabled
                        ? Colors.grey.shade600
                        : textColor ?? AppColors.scaffoldBackground,
                    size: 25.sp,
                  ),
                  7.horizontalSpace,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}