import 'package:easy_deal/features/unit_details/presentation/views/widgets/bottom_navigation_bar_widget.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_broker_info.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_description.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_features.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_image_type_location.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_information.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_location.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_price_status_indoor.dart';
import 'package:easy_deal/main_imports.dart';


class UnitDetailsView extends StatelessWidget {
  const UnitDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.unitDetails),
      body: Padding(
        padding:   EdgeInsets.only(top: 20.h,right: 20.w,left: 20.w),
        child: ListView(
          children: [
            UnitImageTypeLocation(),
            Gap(12.h),
            UnitPriceStatusIndoor(),
            Gap(24.h),
            UnitBrokerInfo(),
            Gap(24.h),
            UnitInformation(),
            Gap(24.h),
            UnitFeatures(),
            Gap(24.h),
            UnitDescription(),
            Gap(24.h),
            UnitLocation(),
          ],
        ),
      ),
      bottomNavigationBar: UnitBottomNavigationBarWidget(),
    );
  }
}
