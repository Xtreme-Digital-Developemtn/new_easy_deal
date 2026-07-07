import 'package:flutter/material.dart';
import '../../../../core/app_services/local_services/cache_helper.dart';
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
          "Built around brokers' needs to streamline \ndaily work and boost productivity.",
    ),
    OnboardingModel(
      imagePath: 'assets/images/pngs/boarding2.png',
      badgeLabel: "Never lose a lead again",
      title: "A Full CRM",
      description:
          "Keep all your clients, properties, and \ncommunications perfectly organized in \none powerful hub.",
    ),
    OnboardingModel(
      imagePath: 'assets/images/pngs/boarding3.png',
      badgeLabel: "Smart Property \nRecommendations",
      title: "AI Auto-\nMatching",
      description:
          "Automatically matches client requests \nbased on location and property type.",
    ),
    OnboardingModel(
      imagePath: 'assets/images/pngs/boarding4.png',
      badgeLabel: "Collaborate seamlessly",
      title: "Share & Track",
      description:
          "Easily share orders and monitor their \nprogress in real-time. ",
    ),
  ];

  bool get _isLastPage => _currentIndex == _pages.length - 1;

  Future<void> _onNext() async {
    if (_isLastPage) {
      Navigator.of(context).pushNamedAndRemoveUntil('loginView', (route) => false);
      await CacheHelper.saveData(
        key: 'onboarding_done',
        value: true,
      );
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _onSkip() async {
    Navigator.of(context).pushNamedAndRemoveUntil('loginView', (route) => false);
    await CacheHelper.saveData(
      key: 'onboarding_done',
      value: true,
    );
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
            OnboardingHeader(onSkip: _onSkip,currentIndex: _currentIndex,),
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