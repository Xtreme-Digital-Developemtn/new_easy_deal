import 'package:easy_localization/easy_localization.dart';
import '../../../../../../main_imports.dart';
import '../../../../../assign_to_broker/presentation/views/widgets/broker_text_helper.dart';
import '../../../data/models/advertisement_shuffle_model.dart';
import '../../view_model/broker_ads_cubit.dart';
import '../../view_model/broker_ads_states.dart';

class AdsListWidget extends StatelessWidget {
  const AdsListWidget({
    super.key,
    required this.data,
    required this.controller,
    required this.isLoadingMore,
  });

  final List<Data> data;

  /// Drives the infinite scroll — the view listens on it and asks the cubit for
  /// the next page as the bottom comes into range.
  final ScrollController controller;

  /// Adds a trailing loader row while the next page is in flight.
  final bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      padding: EdgeInsets.all(16.r),
      itemCount: data.length + (isLoadingMore ? 1 : 0),
      separatorBuilder: (_, __) => Gap(12.h),
      itemBuilder: (context, index) {
        if (index == data.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: CustomLoading()),
          );
        }
        return _AdCard(item: data[index]);
      },
    );
  }
}

/// بيحوّل بيانات الإعلان لحقول الكارت المشترك `UnitAdCard` — نفس التصميم
/// المستخدم في نتائج البحث عشان الاتنين يفضلوا متطابقين.
class _AdCard extends StatelessWidget {
  final Data item;
  const _AdCard({required this.item});

  String _getLocation() {
    final parts = <String>[
      if (item.city?.nameAr != null) item.city!.nameAr!,
      if (item.area?.nameAr != null) item.area!.nameAr!,
      if (item.subArea?.nameAr != null) item.subArea!.nameAr!,
    ];
    return parts.join(" - ");
  }

  @override
  Widget build(BuildContext context) {
    return UnitAdCard(
      unitId: item.id,
      gallery: item.gallery,
      diagram: item.diagram?.toString(),
      typeLabel: BrokerTextHelper.unitTypeText(item.type ?? ''),
      title: item.projectName?.toString() ?? item.developerName?.toString(),
      location: _getLocation(),
      totalPriceInCash: item.totalPriceInCash,
      totalPriceInInstallment: item.totalPriceInInstallment,
      monthlyRent: item.monthlyRent,
      dailyRent: item.dailyRent,
      status: item.status,
      rooms: item.numberOfRooms,
      bathrooms: item.numberOfBathrooms,
      unitArea: item.unitArea,
      operationLabel: BrokerTextHelper.unitOperationText(
        item.unitOperation ?? '',
      ),
      featuredButton: BlocBuilder<BrokerAdsCubit, BrokerAdsStates>(
        builder: (context, state) {
          return ElevatedButton.icon(
            onPressed: () {
              // final cubit = context.read<BrokerAdsCubit>();
              // cubit.selectedUnitId = item.id;
              // cubit.requestsCheckAdvertisementCount();
            },
            icon: const Icon(Icons.campaign_outlined, size: 16),
            label: Text("إعلان مميز".tr()),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryDark,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          );
        },
      ),
    );
  }
}
