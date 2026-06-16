import 'package:easy_deal/features/broker_features/broker_home/presentation/view_model/broker_home_cubit.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/stat_card.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

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
                    title: LangKeys.sold.tr(),
                    subtitle: LangKeys.previousOrders.tr(),
                    count: "${statistics?.allRequestsCount ?? 0}",
                    percentage: "",
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
                    count: "${statistics?.newRequestsCount ?? 0}",
                    percentage: "",
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
                    count: "${statistics?.finishedRequestsCount ?? 0}",
                    percentage: "",
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
                    count: "${statistics?.inProcessingRequestsCount ?? 0}",
                    percentage: "",
                    mainColor: AppColors.orangeOriginal,
                    lightColor: AppColors.orangeMedium,
                    icon: Icons.play_circle_outlined,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}