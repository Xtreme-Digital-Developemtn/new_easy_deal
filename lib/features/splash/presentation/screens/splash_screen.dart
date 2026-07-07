import '../../../../main_imports.dart';
import '../../../layout/presentation/views/layout_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);

    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _checkUserTokenAndNavigate();
      }
    });
  }

  Future<void> _checkUserTokenAndNavigate() async {
    if (!mounted) return;

    try {
      final bool isOnboardingDone =
          await CacheHelper.getData(key: 'onboarding_done') ?? false;

      if (!mounted) return;

      if (!isOnboardingDone) {
        context.pushReplacementNamed(Routes.onBoardingView);
        return;
      }

      final String? userToken = await CacheTokenManger.getUserToken();

      if (!mounted) return;

      if (userToken != null && userToken.isNotEmpty) {
        context.pushReplacementNamed(Routes.layoutView);
      } else {
        context.pushReplacementNamed(Routes.loginView);
      }
    } catch (e) {
      if (mounted) {
        context.pushReplacementNamed(Routes.loginView);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primaryDark, AppColors.white],
            stops: [0.0, 0.7],
          ),
        ),
        child: ScaleTransition(
          scale: _animation,
          child: Center(child: Image.asset(PngImages.logo)),
        ),
      ),
    );
  }
}