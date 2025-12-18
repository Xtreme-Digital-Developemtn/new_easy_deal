import 'package:easy_deal/core/shared_widgets/error_ui.dart';
import 'package:easy_deal/features/unit_details/presentation/view_model/unit_details_cubit.dart';
import 'package:easy_deal/features/unit_details/presentation/view_model/unit_details_states.dart';
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
  const UnitDetailsView({super.key, required this.unitId});

  final int unitId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.unitDetails),
      body: BlocBuilder<UnitDetailsCubit, UnitDetailsStates>(
        buildWhen: (previous, current) {
          return current is GetUnitDetailsSuccessState ||
              current is GetUnitDetailsErrorState ||
              current is GetUnitDetailsLoadingState;
        },
        builder: (context, state) {
          var unitDetailsCubit = context.read<UnitDetailsCubit>();
          return Padding(
            padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
            child:
                state is GetUnitDetailsLoadingState ||
                    unitDetailsCubit.unitDetailsModel == null
                ? CustomLoading()
                : state is GetUnitDetailsErrorState
                ? ErrorWidgetUi(
                    onRetry: () {
                      unitDetailsCubit.getUnitDetails(unitId: unitId);
                    },
                  )
                : ListView(
                    children: [
                      UnitImageTypeLocation(
                        image: unitDetailsCubit.unitDetailsModel!.data!.diagram,
                        apartment:
                            unitDetailsCubit.unitDetailsModel!.data!.type,
                        city: context.isArabic
                            ? unitDetailsCubit
                                  .unitDetailsModel!
                                  .data!
                                  .city!
                                  .nameAr
                            : unitDetailsCubit
                                  .unitDetailsModel!
                                  .data!
                                  .city!
                                  .nameEn,
                        area: context.isArabic
                            ? unitDetailsCubit
                                  .unitDetailsModel!
                                  .data!
                                  .area!
                                  .nameAr
                            : unitDetailsCubit
                                  .unitDetailsModel!
                                  .data!
                                  .area!
                                  .nameEn,
                        subArea: context.isArabic
                            ? unitDetailsCubit
                                  .unitDetailsModel!
                                  .data!
                                  .subArea!
                                  .nameAr
                            : unitDetailsCubit
                                  .unitDetailsModel!
                                  .data!
                                  .subArea!
                                  .nameEn,
                      ),
                      Gap(12.h),
                      UnitPriceStatusIndoor(
                        price: unitDetailsCubit
                            .unitDetailsModel!
                            .data!
                            .totalPriceInCash
                            .toString(),
                        type: unitDetailsCubit.unitDetailsModel!.data!.type,
                        status: unitDetailsCubit.unitDetailsModel!.data!.status,
                      ),
                      Gap(24.h),
                      UnitBrokerInfo(
                        brokerName: unitDetailsCubit
                            .unitDetailsModel!
                            .data!
                            .broker!
                            .name,
                        brokerRate: "5.0",
                        brokerImage: "",
                        brokerVerify: true,
                        brokerSpecializationsList: [],
                        brokerLicense: "brokerLicense",
                      ),
                      Gap(24.h),
                      UnitInformation(
                        beds: unitDetailsCubit.unitDetailsModel!.data!.numberOfRooms,
                        baths: unitDetailsCubit.unitDetailsModel!.data!.numberOfBathrooms,
                        sqft:unitDetailsCubit.unitDetailsModel!.data!.unitArea,
                        areaSize: unitDetailsCubit.unitDetailsModel!.data!.unitArea,
                        poal: unitDetailsCubit.unitDetailsModel!.data!.id,
                        builtIn: unitDetailsCubit.unitDetailsModel!.data!.buildingNumber,
                      ),
                      Gap(24.h),
                      UnitFeatures(),
                      Gap(24.h),
                      UnitDescription(),
                      Gap(24.h),
                      UnitLocation(),
                    ],
                  ),
          );
        },
      ),
      bottomNavigationBar: UnitBottomNavigationBarWidget(),
    );
  }
}
