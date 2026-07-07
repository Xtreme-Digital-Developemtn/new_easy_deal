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
    // Check if widget is still mounted before async operations
    if (!mounted) return;

    try {
      // Await the token retrieval
      final String? userToken = await CacheTokenManger.getUserToken();

      // Check mounted again after async operation
      if (!mounted) return;

      if (userToken != null && userToken.isNotEmpty) {
        print(" User logged in, navigating to LayoutView");
        context.pushNamed(Routes.layoutView);
      } else {
        print(" No token found, navigating to LoginView");
        context.pushNamed(Routes.loginView);
      }
    } catch (e) {
      print(" Error checking token: $e");
      if (mounted) {
        context.pushNamed(Routes.loginView);

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