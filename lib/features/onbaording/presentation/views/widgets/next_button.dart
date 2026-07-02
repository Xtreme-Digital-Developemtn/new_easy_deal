import 'package:flutter/material.dart';

class OnboardingNextButton extends StatelessWidget {
  final bool isLastPage;
  final VoidCallback onPressed;
  const OnboardingNextButton({
    super.key,
    required this.isLastPage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff06164F),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
        shape: const StadiumBorder(),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isLastPage ? "START" : "NEXT",
            style: const TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
          if (!isLastPage) ...[
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ],
      ),
    );
  }
}