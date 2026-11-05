import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_images/svg_images.dart';

class RequestActions extends StatelessWidget {
  const RequestActions({
    super.key,
    this.onNewTap,
    this.onAssignBrokerTap,
    this.onCompleteTap,
    this.onStartProcessingTap,
    this.onWhatsAppTap,
  });

  final VoidCallback? onNewTap;
  final VoidCallback? onAssignBrokerTap;
  final VoidCallback? onCompleteTap;
  final VoidCallback? onStartProcessingTap;

  /// لو مفيش رقم للوسيط بيجي null والشيب ما يظهرش أصلاً
  final VoidCallback? onWhatsAppTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _ActionChip(
          label: 'جديد',
          backgroundColor: const Color(0xFFE4F7E9),
          textColor: const Color(0xFF159447),
          onTap: onNewTap,
        ),

        _ActionChip(
          label: 'تعيين لوسيط',
          backgroundColor: const Color(0xFFF0E1FF),
          textColor: const Color(0xFF8B3DCE),
          onTap: onAssignBrokerTap,
        ),

        _ActionChip(
          label: 'مكتمل',
          icon: Icons.check,
          backgroundColor: const Color(0xFFD9F7E9),
          textColor: const Color(0xFF159447),
          onTap: onCompleteTap,
        ),

        _ActionChip(
          label: 'بدء معالجة',
          icon: Icons.play_arrow,
          backgroundColor: const Color(0xFFDCEAFF),
          textColor: const Color(0xFF3D7DD8),
          onTap: onStartProcessingTap,
        ),

        if (onWhatsAppTap != null)
          _ActionChip(
            label: 'واتساب',
            svgIcon: SvgImages.whatsapp,
            backgroundColor: const Color(0xFFDFF6E4),
            textColor: const Color(0xFF128C7E),
            onTap: onWhatsAppTap,
          ),
      ],
    );
  }
}

class _ActionChip extends StatelessWidget {
  const _ActionChip({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.icon,
    this.svgIcon,
    this.onTap,
  });

  final String label;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;

  /// بديل لـ[icon] للأيقونات اللي جايه من ملف SVG زي لوجو واتساب
  final String? svgIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 7,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (svgIcon != null) ...[
              SvgPicture.asset(
                svgIcon!,
                width: 14,
                height: 14,
                colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
              ),
              const SizedBox(width: 5),
            ] else if (icon != null) ...[
              Icon(
                icon,
                size: 14,
                color: textColor,
              ),
              const SizedBox(width: 5),
            ],
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
