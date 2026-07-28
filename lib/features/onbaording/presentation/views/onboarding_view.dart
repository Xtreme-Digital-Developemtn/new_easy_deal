import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
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

  final List<OnboardingModel> _pages = [
    OnboardingModel(
      imagePath: 'assets/images/pngs/boarding1.png',
      badgeLabel: "theFirstAIPoweredRealEstatePlatform".tr(),
      title: "easyDeal".tr(),
      description:
          "builtAroundBrokersNeeds".tr(),
    ),
    OnboardingModel(
      imagePath: 'assets/images/pngs/boarding2.png',
      badgeLabel: "neverLoseALeadAgain".tr(),
      title: "aFullCRM".tr(),
      description:
          "keepAllYourClients".tr(),
    ),
    OnboardingModel(
      imagePath: 'assets/images/pngs/boarding3.png',
      badgeLabel: "smartPropertyRecommendations".tr(),
      title: "aiAutoMatching".tr(),
      description:
          "automaticallyMatchesClientRequests".tr(),
    ),
    OnboardingModel(
      imagePath: 'assets/images/pngs/boarding4.png',
      badgeLabel: "collaborateSeamlessly".tr(),
      title: "shareAndTrack".tr(),
      description:
          "easilyShareOrders".tr(),
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