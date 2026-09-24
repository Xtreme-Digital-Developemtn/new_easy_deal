import 'package:easy_deal/features/broker_features/broker_home/presentation/view_model/broker_home_cubit.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/stat_card.dart';
import 'package:easy_deal/main_imports.dart';
import '../../view_model/broker_home_states.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key, required this.brokerId});
  final int brokerId;
  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  void initState() {
    super.initState();

    context.read<BrokerHomeCubit>().getBrokerStatistics(
      brokerId: widget.brokerId,
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrokerHomeCubit, BrokerHomeStates>(
      builder: (context, state) {
        var cubit = context.read<BrokerHomeCubit>();
        var statistics = cubit.brokerStatisticsModel?.data;

        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    count2: "${statistics?.finishedRequestsCount ?? 0}",
                    title: "منتهية",
                    subtitle: "الطلبات المنتهية",
                    count: "${statistics?.allRequestsCount ?? 0}",
                    mainColor: AppColors.successDark,
                    lightColor: AppColors.successLight,
                    icon: Icons.history_outlined,
                  ),
                ),
                Gap(12.w),
                Expanded(
                  child: StatCard(
                    count2:  "${statistics?.inProcessingRequestsCount ?? 0}",
                    title: "قيد المعالجة",
                    subtitle: "الطلبات قيد المعالجة",
                    count: "${statistics?.allRequestsCount ?? 0}",
                    mainColor: AppColors.primaryDark,
                    lightColor: AppColors.primaryLight,
                    icon: Icons.access_time_outlined,
                  ),
                ),
              ],
            ),
            // Gap(12.h),
            // Row(
            //   children: [
            //     Expanded(
            //       child: StatCard(
            //         title: LangKeys.inProcess.tr(),
            //         subtitle: LangKeys.completedOrders.tr(),
            //         count: "${statistics?.finishedRequestsCount ?? 0}",
            //         percentage: "",
            //         mainColor: AppColors.successDark,
            //         lightColor: AppColors.successLight,
            //         icon: Icons.check_circle_outlined,
            //       ),
            //     ),
            //     Gap(12.w),
            //     Expanded(
            //       child: StatCard(
            //         title: LangKeys.currentRequests.tr(),
            //         subtitle: LangKeys.activeOrders.tr(),
            //         count: "${statistics?.inProcessingRequestsCount ?? 0}",
            //         percentage: "",
            //         mainColor: AppColors.orangeOriginal,
            //         lightColor: AppColors.orangeMedium,
            //         icon: Icons.play_circle_outlined,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        );
      },
    );
  }
}