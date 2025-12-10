import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/stat_card.dart';
import 'package:easy_deal/main_imports.dart';

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
                title: "الطلبات السابقة",
                subtitle: "Previous Orders",
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
                title: "الطلبات في الانتظار",
                subtitle: "Pending Orders",
                count: "8",
                percentage: "4.4%",
                mainColor: AppColors.warningDark,
                lightColor: AppColors.warningDark,
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
                title: "الطلبات المنتهية",
                subtitle: "Completed Orders",
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
                title: "الطلبات الحالية",
                subtitle: "Active Orders",
                count: "15",
                percentage: "8.3%",
                mainColor: AppColors.primaryDark,
                lightColor: AppColors.primaryLight,
                icon: Icons.play_circle_outlined,
              ),
            ),


          ],
        ),
      ],
    );
  }



}