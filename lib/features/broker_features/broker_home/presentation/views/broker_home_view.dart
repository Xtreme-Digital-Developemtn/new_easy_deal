import 'package:easy_deal/features/broker_features/broker_home/presentation/view_model/broker_home_cubit.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/broker_main_sections.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/last_requests.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/statistics.dart';
import 'package:easy_deal/features/home/presentation/views/widgets/order_statistics_widget.dart';
import 'package:easy_deal/features/broker_features/broker_home/data/models/broker_statistics_model.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../home/presentation/views/widgets/order_statistics_widget.dart';

class BrokerHomeView extends StatelessWidget {
  const BrokerHomeView({super.key});

  Data _buildOrderStatsData(BuildContext context) {
    final model = context.read<BrokerHomeCubit>().brokerStatisticsModel;
    if (model?.data != null) {
      return model!.data!;
    }
    // Return default data if loading or error
    return Data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SafeArea(child: Padding(
        padding:   EdgeInsets.all(20.0.r),
        child: ListView(children: [
          BrokerMainSections(),
          Gap(12.h),
          Statistics(brokerId: CacheHelper.getData(key: "userId"),),
          Gap(12.h),
          OrderStatisticsWidget(data: _buildOrderStatsData(context)),
          Gap(12.h),
           LastRequests(brokerId: CacheHelper.getData(key: "userId"),),
        ],),
      )),
    );
  }
}
