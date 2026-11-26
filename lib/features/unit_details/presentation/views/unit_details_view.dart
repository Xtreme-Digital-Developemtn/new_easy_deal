import 'package:easy_deal/core/shared_widgets/error_ui.dart';
import 'package:easy_deal/features/add_property/data/config/ap_options.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/consultation.dart';
import 'package:easy_deal/features/unit_details/presentation/view_model/unit_details_cubit.dart';
import 'package:easy_deal/features/unit_details/presentation/view_model/unit_details_states.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/bottom_navigation_bar_widget.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_broker_info.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_features.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_image_type_location.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_information.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_location.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_price_status_indoor.dart';
import 'package:easy_deal/main_imports.dart';

class UnitDetailsView extends StatelessWidget {
  const UnitDetailsView({super.key, required this.unitId, this.gallery, this.caption});

  final dynamic unitId;
  final List<dynamic>? gallery;
  final String? caption;

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
            child: state is GetUnitDetailsLoadingState
                ? CustomLoading()
                : state is GetUnitDetailsErrorState
                ? ErrorWidgetUi(
                    onRetry: () {
                      unitDetailsCubit.getUnitDetails(unitId: unitId);
                    },
                  )
                : unitDetailsCubit.unitDetailsModel == null
                ? CustomLoading()
                : ListView(
                    children: [
                      UnitImageTypeLocation(
                        gallery: gallery ?? unitDetailsCubit.unitDetailsModel?.data?.gallery,
                        rawData: unitDetailsCubit.unitDetailsModel?.data?.raw,
                        diagram: unitDetailsCubit.unitDetailsModel?.data?.diagram?.toString(),
                        apartment:
                            unitDetailsCubit.unitDetailsModel?.data?.type ==
                                    null
                                ? null
                                : ApOptions.label(
                                    unitDetailsCubit.unitDetailsModel?.data?.type,
                                    context.isArabic,
                                  ),
                        city: context.isArabic
                            ? unitDetailsCubit
                                  .unitDetailsModel?.data?.city?.nameAr
                            : unitDetailsCubit
                                  .unitDetailsModel?.data?.city?.nameEn,
                        area: context.isArabic
                            ? unitDetailsCubit
                                  .unitDetailsModel?.data?.area?.nameAr
                            : unitDetailsCubit
                                  .unitDetailsModel?.data?.area?.nameEn,
                        subArea: context.isArabic
                            ? unitDetailsCubit
                                  .unitDetailsModel?.data?.subArea?.nameAr
                            : unitDetailsCubit
                                  .unitDetailsModel?.data?.subArea?.nameEn,
                        otherSubAreas: unitDetailsCubit
                            .unitDetailsModel?.data?.otherSubAreas,
                      ),
                      Gap(12.h),
                      Builder(
                        builder: (context) {
                          final data = unitDetailsCubit.unitDetailsModel?.data;
                          final isArabic = context.isArabic;
                          final operation = data?.unitOperation == null
                              ? ''
                              : ApOptions.label(data!.unitOperation, isArabic);
                          final title = (data?.projectName?.toString().trim().isNotEmpty == true)
                              ? data!.projectName.toString()
                              : (data?.developerName?.toString().trim().isNotEmpty == true
                                  ? data!.developerName.toString()
                                  : (data?.type == null
                                      ? ''
                                      : ApOptions.label(data!.type, isArabic)));
                          final heading = [
                            if (operation.trim().isNotEmpty) '($operation)',
                            if (title.trim().isNotEmpty) title.trim(),
                          ].join(' ');
                          final ref = data?.referenceCode ??
                              data?.raw?['referenceCode'] ??
                              data?.raw?['reference_code'] ??
                              data?.modelCode ??
                              data?.modelId ??
                              data?.id;
                          if (heading.trim().isEmpty && ref == null) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (heading.trim().isNotEmpty)
                                  Text(
                                    heading,
                                    style: AppStyles.black16SemiBold.copyWith(fontSize: 18.sp),
                                  ),
                                if (ref != null)
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.h),
                                    child: Text(
                                      'الرقم المرجعي: $ref',
                                      style: AppStyles.gray12Medium,
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                      Builder(
                        builder: (context) {
                          final rawStatus = unitDetailsCubit
                              .unitDetailsModel?.data?.status
                              ?.toString()
                              .trim();
                          return UnitPriceStatusIndoor(
                            price: unitDetailsCubit
                                .unitDetailsModel?.data?.totalPriceInCash
                                ?.toString(),
                            type: ApOptions.label(
                              unitDetailsCubit.unitDetailsModel?.data?.type,
                              context.isArabic,
                            ),
                            // كل الحالات تتترجم (مباع / مؤجر / محجوز / متاح)،
                            // ولو مفيش حالة تظهر «لا يوجد» مش «متاح».
                            status: rawStatus == null || rawStatus.isEmpty
                                ? null
                                : ApOptions.label(rawStatus, context.isArabic),
                            rawStatus: rawStatus,
                          );
                        },
                      ),
                      Gap(24.h),
                      UnitBrokerInfo(
                        brokerName: unitDetailsCubit
                            .unitDetailsModel?.data?.broker?.name,
                        brokerRate: "5.0",
                        brokerImage: unitDetailsCubit
                        .unitDetailsModel?.data?.brokerUserImage,
                        brokerVerify: true,
                        // brokerSpecializationsList: [],
                        // brokerLicense: "",
                      ),
                      Gap(24.h),
                      UnitInformation(
                        data: unitDetailsCubit.unitDetailsModel?.data?.raw,
                      ),
                      Gap(24.h),
                      UnitFeatures(
                        otherAccessories: (unitDetailsCubit
                                    .unitDetailsModel?.data?.otherAccessories
                                as List?)
                            ?.map(
                              (e) => ApOptions.label(
                                e?.toString(),
                                context.isArabic,
                              ),
                            )
                            .toList(),
                      ),
                      Gap(24.h),
                      Builder(
                        builder: (context) {
                          final data = unitDetailsCubit.unitDetailsModel?.data;
                          final desc = (caption != null && caption!.trim().isNotEmpty)
                              ? caption!.trim()
                              : ((data?.raw?['caption']?.toString().trim().isNotEmpty == true)
                                  ? data!.raw!['caption'].toString().trim()
                                  : (data?.additionalDetails?.notes?.toString().trim().isNotEmpty == true
                                      ? data!.additionalDetails!.notes!.toString().trim()
                                      : null));
                          if (desc == null || desc.isEmpty) {
                            return const SizedBox.shrink();
                          }
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
                                Text('الوصف', style: AppStyles.blueDark14Bold),
                                Gap(16.h),
                                Text(desc),
                              ],
                            ),
                          );
                        },
                      ),
                      Gap(24.h),
                      UnitLocation(
                        location: unitDetailsCubit
                            .unitDetailsModel?.data?.location
                            ?.toString(),
                        title: context.isArabic
                            ? unitDetailsCubit
                                  .unitDetailsModel?.data?.city?.nameAr
                            : unitDetailsCubit
                                  .unitDetailsModel?.data?.city?.nameEn,
                      ),
                      Gap(24.h),
                      Builder(
                        builder: (context) {
                          final data = unitDetailsCubit.unitDetailsModel?.data;
                          // الأولوية لرقم البروكر الخاص بالوحدة، ثم ownerPhone كـ fallback
                          final brokerPhone = data?.broker?.phone?.toString().trim().isNotEmpty == true
                              ? data!.broker!.phone.toString()
                              : (data?.ownerPhone?.toString() ?? '');
                          final brokerName = data?.broker?.name?.toString();
                          return ConsultationView(brokerPhone: brokerPhone, brokerName: brokerName);
                        },
                      ),
                      // مسافة أخيرة عشان آخر قسم ما يلزقش في الشريط السفلي
                      Gap(24.h),
                    ],
                  ),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<UnitDetailsCubit, UnitDetailsStates>(
        builder: (context, state) {
          final unit = context.read<UnitDetailsCubit>().unitDetailsModel?.data;
          if (unit == null) return const SizedBox.shrink();
          final brokerPhone = unit.broker?.phone?.toString().trim().isNotEmpty == true
              ? unit.broker!.phone.toString()
              : (unit.ownerPhone?.toString() ?? '');
          return UnitBottomNavigationBarWidget(phone: brokerPhone);
        },
      ),
    );
  }
}