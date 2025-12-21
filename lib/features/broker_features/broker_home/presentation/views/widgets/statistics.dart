import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/stat_card.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: LangKeys.sold.tr(),
                subtitle: LangKeys.previousOrders.tr(),
                count: "42",
                percentage: "23.1%",
                mainColor: AppColors.primaryLight,
                lightColor: AppColors.primaryLight,
                icon: Icons.history_outlined,
              ),
            ),
            Gap(12.w),
            Expanded(
              child: StatCard(
                title: LangKeys.outOfListing.tr(),
                subtitle: LangKeys.pendingOrders.tr(),
                count: "8",
                percentage: "4.4%",
                mainColor: AppColors.errorDark,
                lightColor: AppColors.errorLight,
                icon: Icons.access_time_outlined,
              ),
            ),
          ],
        ),
        Gap(12.h),
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: LangKeys.inProcess.tr(),
                subtitle: LangKeys.completedOrders.tr(),
                count: "24",
                percentage: "12.5%",
                mainColor: AppColors.successDark,
                lightColor: AppColors.successLight,
                icon: Icons.check_circle_outlined,
              ),
            ),
            Gap(12.w),

            Expanded(
              child: StatCard(
                title: LangKeys.currentRequests.tr(),
                subtitle: LangKeys.activeOrders.tr(),
                count: "15",
                percentage: "8.3%",
                mainColor: AppColors.orangeOriginal,
                lightColor: AppColors.orangeMedium,
                icon: Icons.play_circle_outlined,
              ),
            ),


          ],
        ),
      ],
    );
  }



}