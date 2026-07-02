import 'package:flutter/material.dart';
import '../../data/models/onboarding_model.dart';
import 'widgets/bottom_card.dart';
import 'widgets/header.dart';
import 'widgets/onboarding_item.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});
  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingModel> _pages = const [
    OnboardingModel(
      imagePath: 'assets/images/pngs/boarding1.png',
      badgeLabel: "The first AI-Powered real\nestate platform",
      title: "EASY DEAL",
      description:
          "Built around brokers' needs to streamline daily work and boost productivity.",
    ),
    OnboardingModel(
      imagePath: 'assets/images/pngs/boarding2.png',
      badgeLabel: "Never lose a lead again",
      title: "A Full CRM",
      description:
          "Keep all your clients, properties, and communications perfectly organized in one powerful hub.",
    ),
    OnboardingModel(
      imagePath: 'assets/images/pngs/boarding3.png',
      badgeLabel: "Smart Property Recommendations",
      title: "AI Auto-\nMatching",
      description:
          "Automatically matches client requests based on location and property type.",
    ),
    OnboardingModel(
      imagePath: 'assets/images/pngs/boarding4.png',
      badgeLabel: "Collaborate seamlessly",
      title: "Share & Track",
      description:
          "Easily share orders and monitor their progress in real-time. ",
    ),
  ];

  bool get _isLastPage => _currentIndex == _pages.length - 1;

  void _onNext() {
    if (_isLastPage) {
      Navigator.of(context).pushNamedAndRemoveUntil('loginView', (route) => false);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onSkip() {
    Navigator.of(context).pushNamedAndRemoveUntil('loginView', (route) => false);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FC),
      body: SafeArea(
        child: Column(
          children: [
            OnboardingHeader(onSkip: _onSkip),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemBuilder: (context, index) {
                  return OnboardingItem(model: _pages[index]);
                },
              ),
            ),
            BottomCard(
              currentIndex: _currentIndex,
              itemCount: _pages.length,
              isLastPage: _isLastPage,
              model: _pages[_currentIndex],
              onNext: _onNext,
            ),
          ],
        ),
      ),
    );
  }
}