import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/broker_main_sections.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/last_requests.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/statistics.dart';
import 'package:easy_deal/main_imports.dart';

class BrokerHomeView extends StatelessWidget {
  const BrokerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding:   EdgeInsets.all(20.0.r),
        child: ListView(children: [
          BrokerMainSections(),
          Gap(12.h),
          Statistics(),
          Gap(12.h),
          LastRequests(),
        ],),
      )),
    );
  }
}
