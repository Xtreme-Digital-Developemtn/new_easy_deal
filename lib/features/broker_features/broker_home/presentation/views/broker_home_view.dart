import 'package:easy_deal/features/broker_features/broker_home/presentation/view_model/broker_home_cubit.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/view_model/broker_home_states.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/broker_main_sections.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/last_requests.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/statistics.dart';
import 'package:easy_deal/features/home/presentation/views/widgets/order_statistics_widget.dart';
import 'package:easy_deal/features/broker_features/broker_home/data/models/broker_statistics_model.dart';
import 'package:easy_deal/main_imports.dart';

class BrokerHomeView extends StatelessWidget {
  const BrokerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // لا نستخدم Scaffold داخلي لأن LayoutView يوفر Scaffold خارجي - التداخل يسبب hitTest على _ScaffoldSlot.floatingActionButton قبل اكتمال layout
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            BrokerMainSections(),
            Gap(12.h),
            Statistics(brokerId: CacheHelper.getData(key: "userId")),
            Gap(12.h),
            BlocBuilder<BrokerHomeCubit, BrokerHomeStates>(
              builder: (context, state) {
                final data = context.read<BrokerHomeCubit>().brokerStatisticsModel?.data ?? Data();
                return OrderStatisticsWidget(data: data);
              },
            ),
            Gap(12.h),
            LastRequests(brokerId: CacheHelper.getData(key: "userId")),
          ],
        ),
      ),
    );
  }
}
