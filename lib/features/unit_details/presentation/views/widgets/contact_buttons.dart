import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactButtons extends StatelessWidget {
  const ContactButtons({super.key, required this.brokerPhone});
  final String brokerPhone;

  String get _cleanPhone => brokerPhone.replaceAll(RegExp(r'[^0-9]'), '');

  bool get _hasPhone => _cleanPhone.isNotEmpty;

  Future<void> _makePhoneCall() async {
    if (!_hasPhone) return;
    final uri = Uri(scheme: 'tel', path: _cleanPhone);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Call Error: $e');
    }
  }

  Future<void> _openWhatsApp() async {
    if (!_hasPhone) return;
    var phone = _cleanPhone;
    if (phone.startsWith('01')) {
      phone = '20$phone';
    } else if (phone.startsWith('1') && phone.length == 10) {
      phone = '20$phone';
    }
    final uri = Uri.parse('https://wa.me/$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Cannot open WhatsApp for $phone');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ContactButton(
            title: 'اتصل 📞',
            backgroundColor: const Color(0xFF339F6D),
            textColor: Colors.white,
            onTap: _hasPhone ? _makePhoneCall : () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('رقم البروكر غير متوفر')),
              );
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
            onTap: _hasPhone ? _openWhatsApp : () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('رقم البروكر غير متوفر')),
              );
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