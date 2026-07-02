import 'package:flutter/material.dart';

class OnboardingIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;
  const OnboardingIndicator({
    super.key,
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(itemCount, (index) {
        bool active = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: active ? 22 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: active ? const Color(0xff06164F) : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }),
    );
  }
}