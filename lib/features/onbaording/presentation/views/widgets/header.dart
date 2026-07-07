import '../../../../../main_imports.dart';

class OnboardingHeader extends StatelessWidget {
  final VoidCallback onSkip;
  final int currentIndex;

  const OnboardingHeader({
    super.key,
    required this.onSkip,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final icons = [
      "assets/images/svgs/onboardnig_icon_1.svg",
      "assets/images/svgs/onboardnig_icon_2.svg",
      "assets/images/svgs/onboardnig_icon_3.svg",
      "assets/images/svgs/onboardnig_icon_4.svg",
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 45,
            height: 45,
            padding: const EdgeInsets.all(8),
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
            child: SvgPicture.asset(
              icons[currentIndex],
            ),
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