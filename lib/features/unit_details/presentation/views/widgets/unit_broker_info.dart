import 'package:easy_deal/main_imports.dart';

import 'broker_name_image_rate_selling.dart';
import 'broker_specializations_list.dart';
import 'broker_verified_mark.dart';

class UnitBrokerInfo extends StatelessWidget {
  const UnitBrokerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.gray1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BrokerNameImageRateSelling(),
          Gap(12.h),
          BrokerVerifiedMark(),
          Gap(8.h),
          BrokerSpecializationsList(),
        ],
      ),
    );
  }
}
