import 'package:easy_deal/features/request_details/presentation/views/widgets/additional_Information.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/basic_info_section.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/broker_info_section.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/finances_and_notes.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/order_Information.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/property_details.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/site_details.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/status_information.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class RequestDetailsView extends StatelessWidget {
  const RequestDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.requestDetails),
      body: SingleChildScrollView(
        child: Padding(
          padding:   EdgeInsets.all(20.0.r),
          child: Column(
            children: [
              BrokerInfoSection(),
              BasicInfo(),
              SiteDetails(),
              PropertyDetails(),
              StatusInformation(),
              AdditionalInformation(),
              FinancesAndNotes(),
              OrderInformation(),
              Gap(24.h),
              CustomButton(
                onPressed: (){},
                color: AppColors.errorDark,
                gradientColors: false,
                text: LangKeys.cancel.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
