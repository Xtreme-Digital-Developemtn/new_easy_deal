import 'package:easy_deal/features/home/presentation/views/widgets/best_seller_units.dart';
import 'package:easy_deal/features/home/presentation/views/widgets/categories.dart';
import 'package:easy_deal/features/home/presentation/views/widgets/explore_the_sites.dart';
import 'package:easy_deal/features/home/presentation/views/widgets/home_slider_images.dart';
import 'package:easy_deal/features/home/presentation/views/widgets/latest_articles.dart';
 import '../../../../main_imports.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HomeSliderImages(),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20.h),
                  const Categories(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20.h),
                  const BestSellerUnits(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: const ExploreTheSites(),
            ),
            SliverToBoxAdapter(
              child: const LatestArticles(),
            ),
          ],
        ),
      ),
    );
  }
}