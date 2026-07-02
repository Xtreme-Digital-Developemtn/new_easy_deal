import 'package:flutter/material.dart';
import '../../../data/models/onboarding_model.dart';
import 'indicator.dart';
import 'next_button.dart';

class BottomCard extends StatelessWidget {
  final int currentIndex;
  final int itemCount;
  final bool isLastPage;
  final OnboardingModel model;
  final VoidCallback onNext;

  const BottomCard({
    super.key,
    required this.currentIndex,
    required this.itemCount,
    required this.isLastPage,
    required this.model,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.badgeLabel,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: Color(0xff06164F),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            model.description,
            style: TextStyle(
              color: Colors.grey.shade600,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 35),
          Row(
            children: [
              OnboardingIndicator(
                currentIndex: currentIndex,
                itemCount: itemCount,
              ),
              const Spacer(),
              OnboardingNextButton(
                isLastPage: isLastPage,
                onPressed: onNext,
              ),
            ],
          ),
        ],
      ),
    );
  }
}