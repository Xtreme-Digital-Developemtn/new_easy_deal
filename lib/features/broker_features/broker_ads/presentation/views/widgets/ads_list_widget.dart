import 'package:easy_localization/easy_localization.dart';
import '../../../../../../main_imports.dart';
import '../../../../../assign_to_broker/presentation/views/widgets/broker_text_helper.dart';
import '../../../data/models/advertisement_shuffle_model.dart';
import '../../view_model/broker_ads_cubit.dart';
import '../../view_model/broker_ads_states.dart';

class AdsListWidget extends StatelessWidget {
  const AdsListWidget({super.key, required this.data});

  final List<Data> data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16.r),
      itemCount: data.length,
      separatorBuilder: (_, __) => Gap(12.h),
      itemBuilder: (context, index) => _AdCard(item: data[index]),
    );
  }
}

class _AdCard extends StatelessWidget {
  final Data item;
  const _AdCard({required this.item});

  String _buildImageUrl(String? url) {
    if (url == null || url.isEmpty) return '';
    if (url.startsWith('http://') || url.startsWith('https://')) return url;
    return '${EndPoints.imageBaseUrl}$url';
  }

  String? _getFirstImageUrl() {
    // Check gallery for images first
    if (item.gallery != null && item.gallery!.isNotEmpty) {
      for (final g in item.gallery!) {
        if (g is Map && g['type'] == 'image' && g['url'] != null) {
          return _buildImageUrl(g['url'].toString());
        }
      }
      // If no images, check for any gallery item with url (fallback)
      for (final g in item.gallery!) {
        if (g is Map && g['url'] != null) {
          return _buildImageUrl(g['url'].toString());
        }
      }
    }
    // Fallback to diagram
    if (item.diagram != null && item.diagram!.isNotEmpty) {
      return _buildImageUrl(item.diagram!.toString());
    }
    return null;
  }

  List<String> _getGalleryImageUrls() {
    final urls = <String>[];
    if (item.gallery != null && item.gallery!.isNotEmpty) {
      for (final g in item.gallery!) {
        if (g is Map && g['type'] == 'image' && g['url'] != null) {
          urls.add(_buildImageUrl(g['url'].toString()));
        }
      }
    }
    return urls;
  }

  String _getPrice() {
    if (item.totalPriceInCash != null) return "${item.totalPriceInCash} جنيه";
    if (item.monthlyRent != null) return "${item.monthlyRent} جنيه/شهر";
    if (item.dailyRent != null) return "${item.dailyRent} جنيه/يوم";
    return "غير محدد";
  }

  String _getLocation() {
    final parts = <String>[];
    if (item.city?.nameAr != null) parts.add(item.city!.nameAr!);
    if (item.area?.nameAr != null) parts.add(item.area!.nameAr!);
    if (item.subArea?.nameAr != null) parts.add(item.subArea!.nameAr!);
    return parts.join(" - ");
  }

  @override
  Widget build(BuildContext context) {
    final firstImageUrl = _getFirstImageUrl();
    final galleryImages = _getGalleryImageUrls();

    return Card(
      elevation: 2,
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: () => context.pushNamed(Routes.unitDetailsView, arguments: {"unitId": item.id}),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    firstImageUrl != null
                        ? CachedNetworkImage(
                            imageUrl: firstImageUrl,
                            fit: BoxFit.cover,
                            placeholder: (c, _) => _buildLogoPlaceholder(item.diagram),
                            errorWidget: (c, _, __) => _buildLogoPlaceholder(item.diagram),
                          )
                        : _buildLogoPlaceholder(item.diagram),
                    Positioned(
                      top: 8.h,
                      right: 8.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: AppColors.primaryDark,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          BrokerTextHelper.unitTypeText(item.type ?? ''),
                          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8.h,
                      left: 8.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.photo_library_outlined, size: 12, color: Colors.white),
                            Gap(4.w),
                            Text(
                              "${galleryImages.length}",
                              style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (item.status?.toLowerCase() == 'sold')
                      Positioned(
                        bottom: 8.h,
                        right: 8.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            "مباع".tr(),
                            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.projectName?.toString() ?? item.developerName?.toString() ?? 'عقار',
                              style: AppStyles.black14SemiBold.copyWith(fontSize: 16.sp),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Gap(4.h),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined, size: 12.sp, color: Colors.grey[600]),
                                Gap(4.w),
                                Expanded(
                                  child: Text(
                                    _getLocation(),
                                    style: AppStyles.gray12Medium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            _getPrice(),
                            style: AppStyles.primary16Medium.copyWith(fontSize: 16.sp),
                          ),
                          Gap(4.h),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              color: _getStatusColor(item.status ?? '').withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              _getStatusText(item.status ?? ''),
                              style: TextStyle(
                                color: _getStatusColor(item.status ?? ''),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gap(12.h),
                  Row(
                    children: [
                      _InfoChip(
                        icon: Icons.king_bed_outlined,
                        label: "${item.numberOfRooms ?? 0} غرف",
                      ),
                      Gap(8.w),
                      _InfoChip(
                        icon: Icons.bathtub_outlined,
                        label: "${item.numberOfBathrooms ?? 0} حمام",
                      ),
                      Gap(8.w),
                      _InfoChip(
                        icon: Icons.straighten_outlined,
                        label: "${item.unitArea ?? 0} م²",
                      ),
                      Gap(8.w),
                      _InfoChip(
                        icon: Icons.business_outlined,
                        label: BrokerTextHelper.unitOperationText(item.unitOperation ?? ''),
                      ),
                    ],
                  ),
                  Gap(12.h),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => context.pushNamed(Routes.unitDetailsView, arguments: {"unitId": item.id}),
                          icon: const Icon(Icons.visibility_outlined, size: 16),
                          label: Text("عرض".tr()),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.primaryDark,
                            side: BorderSide(color: AppColors.primaryDark),
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                          ),
                        ),
                      ),
                      Gap(8.w),
                      Expanded(
                        child: BlocBuilder<BrokerAdsCubit, BrokerAdsStates>(
                          builder: (context, state) {
                            final cubit = context.read<BrokerAdsCubit>();
                            return ElevatedButton.icon(
                              onPressed: () {
                                // cubit.selectedUnitId = item.id;
                                // cubit.requestsCheckAdvertisementCount();
                              },
                              icon: const Icon(Icons.campaign_outlined, size: 16),
                              label: Text("إعلان مميز".tr()),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryDark,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoPlaceholder(digram) {
    return CachedNetworkImage(
      imageUrl: digram,
      fit: BoxFit.cover,

    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'available':
        return Colors.green;
      case 'sold':
        return Colors.red;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'available':
        return "متاح".tr();
      case 'sold':
        return "مباع".tr();
      case 'pending':
        return "قيد الانتظار".tr();
      default:
        return status;
    }
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 6.w),
        decoration: BoxDecoration(
          color: AppColors.grayLight.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 14.sp, color: AppColors.primaryDark),
            Gap(4.w),
            Flexible(
              child: Text(
                label,
                style: AppStyles.black12Medium.copyWith(fontSize: 11.sp),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}