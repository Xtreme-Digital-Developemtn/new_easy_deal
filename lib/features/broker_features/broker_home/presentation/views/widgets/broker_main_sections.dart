import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/start_new_request.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import 'broker_categories.dart';

class BrokerMainSections extends StatelessWidget {
  const BrokerMainSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StartNewRequest(),
        Gap(12.h),
        BrokerCategories(),
      ],
    );
  }
}
