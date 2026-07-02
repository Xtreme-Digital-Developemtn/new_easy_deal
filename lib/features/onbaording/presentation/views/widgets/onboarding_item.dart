import 'package:flutter/material.dart';
import '../../../data/models/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel model;
  const OnboardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Image.asset(
          model.imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}