import 'package:flutter/material.dart';

class ContactButtons extends StatelessWidget {
  const ContactButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ContactButton(
            title: 'اتصل 📞',
            backgroundColor: const Color(0xFF339F6D),
            textColor: Colors.white,
            onTap: () {
              // Call
            },
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _ContactButton(
            title: 'واتساب',
            backgroundColor: Colors.white,
            textColor: const Color(0xFF333333),
            borderColor: const Color(0xFFD9D9D9),
            onTap: () {
              // WhatsApp
            },
          ),
        ),
      ],
    );
  }
}

class _ContactButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback onTap;

  const _ContactButton({
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          side: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}