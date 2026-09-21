import 'package:flutter/material.dart';

class RequestActions extends StatelessWidget {
  const RequestActions({
    super.key,
    this.onNewTap,
    this.onAssignBrokerTap,
    this.onCompleteTap,
    this.onStartProcessingTap,
  });

  final VoidCallback? onNewTap;
  final VoidCallback? onAssignBrokerTap;
  final VoidCallback? onCompleteTap;
  final VoidCallback? onStartProcessingTap;

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
    this.onTap,
  });

  final String label;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;
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
            if (icon != null) ...[
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