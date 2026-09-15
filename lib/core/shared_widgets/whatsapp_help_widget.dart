import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_deal/core/themes/app_colors.dart';
import 'package:easy_deal/core/themes/app_styles.dart';

/// ويدجت "محتاج مساعدة تواصل معنا" يفتح الواتساب على الرقم 01098727829
class WhatsAppHelpWidget extends StatelessWidget {
  const WhatsAppHelpWidget({
    super.key,
    this.phoneNumber = '01098727829',
  });

  final String phoneNumber;

  Future<void> _openWhatsApp(BuildContext context) async {
    // تنظيف الرقم وتحويله للصيغة الدولية 20XXXXXXXXXX
    String formatted = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    if (formatted.startsWith('0')) {
      formatted = '20${formatted.substring(1)}';
    } else if (!formatted.startsWith('20')) {
      formatted = '20$formatted';
    }

    final Uri whatsappUri = Uri.parse('https://wa.me/$formatted');

    try {
      if (await canLaunchUrl(whatsappUri)) {
        await launchUrl(
          whatsappUri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('لا يمكن فتح الواتساب حالياً')),
          );
        }
      }
    } catch (e) {
      debugPrint('WhatsApp launch error: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('حدث خطأ أثناء فتح الواتساب')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openWhatsApp(context),
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.successVeryLight,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.green.withValues(alpha: 0.25)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // أيقونة واتساب خضراء
            Container(
              width: 28.w,
              height: 28.w,
              decoration: const BoxDecoration(
                color: AppColors.green,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.chat_bubble,
                size: 16.sp,
                color: AppColors.white,
              ),
            ),
            Gap(8.w),
            // النص: "محتاج مساعدة "
            Text(
              'محتاج مساعدة؟ ',
              style: AppStyles.black14Medium.copyWith(
                fontSize: 14.sp,
              ),
            ),
            // "تواصل معنا" قابلة للضغط ومميزة
            Text(
              'تواصل معنا',
              style: AppStyles.primary14Medium.copyWith(
                color: AppColors.greenDark,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.greenDark,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gap(4.w),
            Icon(
              Icons.open_in_new,
              size: 14.sp,
              color: AppColors.greenDark,
            ),
          ],
        ),
      ),
    );
  }
}
