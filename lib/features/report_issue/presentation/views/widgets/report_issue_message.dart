import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class ReportIssueMessage extends StatelessWidget {
  const ReportIssueMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LangKeys.typeTheMessageIfYouWant.tr(),style: AppStyles.primary16SemiBold,),
        Gap(20.h),
        TextField(
          maxLines: 5,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(  8.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular( 8.r),
              borderSide: BorderSide(
                color:  AppColors.grayLight,
                width:  1.sp,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular( 8.r),
              borderSide: BorderSide(
                color:  AppColors.errorLight,
                width:  1.sp,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular( 8.r),
              borderSide: BorderSide(
                color: Colors.red,
                width:  1.sp,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular( 8.r),
              borderSide: BorderSide(
                color: Colors.red,
                width:  1.sp,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular( 8.r),
              borderSide: BorderSide(
                color:  AppColors.grayLight,
                width:  1.sp,
              ),
            ),
            labelText: "",
            labelStyle:   TextStyle(
              color: AppColors.gray,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),

            hintStyle:
                TextStyle(
                  color: AppColors.gray,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
            filled: true,
            prefixIconColor: AppColors.primaryDark,
            suffixIconColor: AppColors.primaryDark,
            enabled:   true,
            contentPadding:
                EdgeInsets.symmetric(
                    horizontal:  15.w, vertical:  15.h),
            fillColor:  AppColors.scaffoldBackground,
          ),
        ),
      ],
    );
  }
}
