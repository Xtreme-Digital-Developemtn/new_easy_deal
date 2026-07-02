import 'package:flutter/material.dart';

class OnboardingHeader extends StatelessWidget {
  final VoidCallback onSkip;
  const OnboardingHeader({super.key, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Icon(Icons.auto_awesome, color: Color(0xff0A1E5E)),
          ),
          TextButton(
            onPressed: onSkip,
            child: const Text(
              "SKIP",
              style: TextStyle(
                letterSpacing: 1.5,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}