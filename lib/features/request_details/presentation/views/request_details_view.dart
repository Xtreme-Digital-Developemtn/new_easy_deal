import 'package:easy_deal/core/shared_widgets/error_ui.dart';
import 'package:easy_deal/features/request_details/presentation/view_model/request_details_cubit.dart';
import 'package:easy_deal/features/request_details/presentation/view_model/request_details_states.dart';
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
      body: BlocBuilder<RequestDetailsCubit, RequestDetailsStates>(
        builder: (context, state) {
          var requestDetailsCubit = context.read<RequestDetailsCubit>();
          return state is GetRequestDetailsLoadingState
              ? CustomLoading()
              : state is GetRequestDetailsErrorState
              ? ErrorWidgetUi(
                  onRetry: () {
                    requestDetailsCubit.requestDetails(requestId: 10);
                  },
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0.r),
                    child: Column(
                      children: [
                        BrokerInfoSection(
                          user: requestDetailsCubit
                              .requestDetailsModel!
                              .data!
                              .user,
                        ),
                        BasicInfo(
                          typeOfOperation: requestDetailsCubit
                              .requestDetailsModel!
                              .data!
                              .type!,
                          scopeOfSpecialization: requestDetailsCubit
                              .requestDetailsModel!
                              .data!
                              .specializationScope!,
                          unitType: requestDetailsCubit
                              .requestDetailsModel!
                              .data!
                              .unit!,
                        ),
                        SiteDetails(
                          address: requestDetailsCubit
                              .requestDetailsModel!
                              .data!
                              .detailedAddress
                              .toString(),
                          locations: requestDetailsCubit
                              .requestDetailsModel!
                              .data!
                              .locations,
                        ),
                        PropertyDetails(attributes: requestDetailsCubit
                            .requestDetailsModel!
                            .data!
                            .attributes,),
                        StatusInformation(status: requestDetailsCubit
                            .requestDetailsModel!
                            .data!
                            .status.toString(), finishingCondition: requestDetailsCubit
                            .requestDetailsModel!
                            .data!
                            .numberOfReplies.toString(),),
                        AdditionalInformation(),
                        FinancesAndNotes(),
                        OrderInformation(),
                        Gap(24.h),
                        CustomButton(
                          onPressed: () {},
                          color: AppColors.errorDark,
                          gradientColors: false,
                          text: LangKeys.cancel.tr(),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
