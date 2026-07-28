import 'package:easy_deal/core/app_services/remote_services/service_locator.dart';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/broker_features/broker_developers/data/repos/broker_developers_repo_imple.dart';
import 'package:easy_deal/features/unit_details/data/models/unit_details_response.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_broker_info.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_description.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_features.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_image_type_location.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_information.dart';
import 'package:easy_deal/features/unit_details/presentation/views/widgets/unit_price_status_indoor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/main_imports.dart';
import '../view_model/broker_developers_cubit.dart';
import '../view_model/broker_developers_states.dart';

class UnitDetailsFromModelView extends StatefulWidget {
  final int unitId;
  const UnitDetailsFromModelView({super.key, required this.unitId});

  @override
  State<UnitDetailsFromModelView> createState() =>
      _UnitDetailsFromModelViewState();
}

class _UnitDetailsFromModelViewState extends State<UnitDetailsFromModelView> {
  late final BrokerDevelopersCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BrokerDevelopersCubit(getIt.get<BrokerDevelopersRepoImpl>());
    _cubit.getUnitDetails(widget.unitId);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: GlobalAppBar(title: LangKeys.unitDetails),
        body: BlocConsumer<BrokerDevelopersCubit, BrokerDevelopersStates>(
          listener: (context, state) {
            if (state is GetUnitDetailsErrorState) {
              Toast.showErrorToast(msg: state.error, context: context);
            }
          },
          builder: (context, state) {
            if (state is GetUnitDetailsLoadingState) {
              return const CustomLoading();
            }
            if (state is GetUnitDetailsErrorState) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.error_outline,
                        size: 48.sp, color: AppColors.grayMedium),
                    Gap(12.h),
                    Text(
                      state.error,
                      style: AppStyles.gray14Medium,
                      textAlign: TextAlign.center,
                    ),
                    Gap(20.h),
                    CustomButton(
                      text: LangKeys.reload,
                      onPressed: () => _cubit.getUnitDetails(widget.unitId),
                      width: 200.w,
                    ),
                  ],
                ),
              );
            }
            if (state is GetUnitDetailsSuccessState) {
              return _UnitDetailsBody(unit: state.unitDetails.data);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

// ─── Body ──────────────────────────────────────────────────────────────────────

class _UnitDetailsBody extends StatelessWidget {
  final UnitData unit;
  const _UnitDetailsBody({required this.unit});

  @override
  Widget build(BuildContext context) {
    final isAr = context.locale.languageCode == 'ar';
    final na = LangKeys.notAvailable.tr();

    return ListView(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 32.h),
      children: [
        // ── صورة + نوع + موقع ──────────────────────────────────────────
        UnitImageTypeLocation(
          image: unit.diagram.isNotEmpty ? unit.diagram : null,
          apartment: unit.type,
          city: isAr ? unit.city.nameAr : unit.city.nameEn,
          area: isAr ? unit.area.nameAr : unit.area.nameEn,
          subArea: isAr ? unit.subArea.nameAr : unit.subArea.nameEn,
        ),
        Gap(20.h),

        // ── السعر + الحالة ─────────────────────────────────────────────
        UnitPriceStatusIndoor(
          price: unit.totalPriceInCash > 0
              ? unit.totalPriceInCash.toString()
              : null,
          type: unit.unitOperation,
          status: unit.status,
        ),
        Gap(20.h),

        // ── بطاقة المطور / المشروع ─────────────────────────────────────
        _InfoCard(
          icon: Icons.business_rounded,
          title: LangKeys.developer.tr(),
          children: [
            _InfoRow(
              label: LangKeys.developerName.tr(),
              value: unit.developerName,
            ),
            _InfoRow(
              label: LangKeys.projectName.tr(),
              value: unit.projectName,
            ),
            _InfoRow(
              label: LangKeys.operationManagement.tr(),
              value: unit.project.managementTeam,
            ),
          ],
        ),
        Gap(16.h),

        // ── بيانات الوحدة ──────────────────────────────────────────────
        UnitInformation(
          beds: unit.numberOfRooms,
          baths: unit.numberOfBathrooms,
          sqft: unit.unitArea,
          areaSize: unit.unitArea,
          poal: unit.id,
          builtIn: unit.buildingNumber,
        ),
        Gap(16.h),

        // ── تفاصيل إضافية ──────────────────────────────────────────────
        _InfoCard(
          icon: Icons.info_outline_rounded,
          title: LangKeys.basicInformation.tr(),
          children: [
            _InfoRow(label: LangKeys.unitNumber.tr(), value: unit.unitNumber),
            _InfoRow(label: LangKeys.floor.tr(), value: unit.floor),
            _InfoRow(label: LangKeys.unitType.tr(), value: unit.type),
            _InfoRow(label: LangKeys.subUnitType.tr(), value: unit.unitOperation),
            _InfoRow(label: LangKeys.compoundType.tr(), value: unit.compoundType),
            _InfoRow(label: LangKeys.theView.tr(), value: unit.view),
            _InfoRow(
                label: LangKeys.finishingCondition.tr(),
                value: unit.finishingType),
            _InfoRow(
                label: LangKeys.deliveryStatus.tr(),
                value: unit.deliveryStatus),
            _InfoRow(
                label: LangKeys.deliveryStatus.tr(),
                value: unit.deliveryDate.isNotEmpty ? unit.deliveryDate : na),
            _InfoRow(
                label: LangKeys.paymentSystem.tr(),
                value: unit.paymentSystem),
          ],
        ),
        Gap(16.h),

        // ── الأسعار التفصيلية ──────────────────────────────────────────
        _InfoCard(
          icon: Icons.payments_rounded,
          title: LangKeys.financialInformation.tr(),
          children: [
            _InfoRow(
              label: LangKeys.price.tr(),
              value: unit.totalPriceInCash > 0
                  ? '${unit.totalPriceInCash} ${LangKeys.egp.tr()}'
                  : na,
            ),
            _InfoRow(
              label: LangKeys.paymentSystem.tr(),
              value: unit.totalPriceInInstallment > 0
                  ? '${unit.totalPriceInInstallment} ${LangKeys.egp.tr()}'
                  : na,
            ),
            _InfoRow(
              label: LangKeys.pricePerMeter.tr(),
              value: unit.pricePerMeterInCash > 0
                  ? '${unit.pricePerMeterInCash} ${LangKeys.egp.tr()}'
                  : na,
            ),
          ],
        ),
        Gap(16.h),

        // ── المميزات ──────────────────────────────────────────────────
          if (unit.otherAccessories!.isNotEmpty) ...[
            UnitFeatures(
              otherAccessories: unit.otherAccessories
                  !.map((e) => e.toString())
                  .toList(),
            ),
            Gap(16.h),
          ],


        // ── المعرض ───────────────────────────────────────────────────
        if (unit.gallery.isNotEmpty) ...[
          _GallerySection(gallery: unit.gallery),
          Gap(16.h),
        ],

        // ── معلومات المالك ────────────────────────────────────────────
        if (unit.ownerName != null || unit.ownerPhone != null)
          _InfoCard(
            icon: Icons.person_rounded,
            title: LangKeys.ownerName.tr(),
            children: [
              if (unit.ownerName != null)
                _InfoRow(label: LangKeys.fullName.tr(), value: unit.ownerName!),
              if (unit.ownerPhone != null)
                _InfoRow(
                    label: LangKeys.phoneNumber.tr(),
                    value: unit.ownerPhone!),
            ],
          ),
        Gap(16.h),

        // ── البروكر ───────────────────────────────────────────────────
        UnitBrokerInfo(
          brokerName: unit.brokerUserFullName ?? unit.broker.name,
          brokerRate: '5.0',
          brokerImage: unit.brokerUserImage,
          brokerVerify: true,
          brokerSpecializationsList: const [],
          brokerLicense: '',
        ),
        Gap(16.h),

        // ── الملاحظات ─────────────────────────────────────────────────
        UnitDescription(notes: unit.additionalDetails.notes),
      ],
    );
  }
}

// ─── Reusable info card ────────────────────────────────────────────────────────

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;
  const _InfoCard(
      {required this.icon, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.gray1,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18.sp, color: AppColors.primaryDark),
              Gap(8.w),
              Text(title, style: AppStyles.blueDark14Bold),
            ],
          ),
          Gap(12.h),
          ...children,
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140.w,
            child: Text(
              label,
              style: AppStyles.gray12Medium,
            ),
          ),
          Gap(8.w),
          Expanded(
            child: Text(
              value.isNotEmpty ? value : LangKeys.notAvailable.tr(),
              style: AppStyles.black12Medium,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Gallery section ───────────────────────────────────────────────────────────

class _GallerySection extends StatelessWidget {
  final List<GalleryItem> gallery;
  const _GallerySection({required this.gallery});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.gray1,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.photo_library_rounded,
                  size: 18.sp, color: AppColors.primaryDark),
              Gap(8.w),
              Text(LangKeys.galleryImages.tr(),
                  style: AppStyles.blueDark14Bold),
              Gap(6.w),
              Text(
                '(${gallery.length})',
                style: AppStyles.gray12Medium,
              ),
            ],
          ),
          Gap(12.h),
          SizedBox(
            height: 100.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: gallery.length,
              separatorBuilder: (_, __) => Gap(8.w),
              itemBuilder: (context, index) {
                final item = gallery[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: item.type == 'video'
                      ? Container(
                          width: 100.w,
                          color: Colors.black12,
                          child: Icon(Icons.play_circle_fill_rounded,
                              size: 36.sp, color: AppColors.primaryDark),
                        )
                      : CustomNetWorkImage(
                          width: 100.w,
                          height: 100.h,
                          fit: BoxFit.cover,
                          imageUrl: item.url,
                          raduis: 8.r,
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
