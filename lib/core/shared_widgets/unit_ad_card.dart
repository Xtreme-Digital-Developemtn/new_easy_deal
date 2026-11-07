import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/main_imports.dart';

/// كارت إعلان الوحدة — نفس تصميم كارت شاشة «إعلاناتي» بالظبط،
/// بيستخدم هناك وفي نتائج البحث عشان التصميم يفضل موحّد.
class UnitAdCard extends StatelessWidget {
  const UnitAdCard({
    super.key,
    required this.unitId,
    this.gallery,
    this.diagram,
    this.typeLabel,
    this.title,
    this.location,
    this.totalPriceInCash,
    this.totalPriceInInstallment,
    this.monthlyRent,
    this.dailyRent,
    this.status,
    this.rooms,
    this.bathrooms,
    this.unitArea,
    this.operationLabel,
    this.featuredButton,
  });

  /// بيستخدم للتنقل لتفاصيل الوحدة عند الضغط على الكارت أو زرار «عرض».
  final dynamic unitId;

  /// عناصر الجاليري بصيغة الـ API: maps فيها `type` و `url`.
  final List<dynamic>? gallery;

  /// صورة الـ fallback (الدايجرام) لو مفيش صور في الجاليري.
  final String? diagram;

  /// اسم نوع الوحدة بعد الترجمة (مثل: شقة) — التاج اللي فوق على الصورة.
  final String? typeLabel;

  /// العنوان اللي بيظهر فوق (اسم المشروع/المطور) — بيقع لـ «عقار» لو فاضي.
  final String? title;

  /// نص الموقع الجاهز (مثل: القاهرة - المعادي) — لو فاضي السطر بيختفي.
  final String? location;

  final dynamic totalPriceInCash;
  final dynamic totalPriceInInstallment;
  final dynamic monthlyRent;
  final dynamic dailyRent;

  /// الحالة (available / sold / pending) — بتاخد تاج لون وتشيل شارة «مباع».
  final String? status;

  final dynamic rooms;
  final dynamic bathrooms;
  final dynamic unitArea;

  /// اسم العملية بعد الترجمة (مثل: بيع) — آخر شيب في صف البيانات.
  final String? operationLabel;

  /// زرار «إعلان مميز» — بيتبعت من شاشة إعلاناتي بس، ولو مفيش بيتخفي
  /// وزرار «عرض» بياخد عرض الصف كله.
  final Widget? featuredButton;

  String _buildImageUrl(String? url) {
    if (url == null || url.isEmpty) return '';
    if (url.startsWith('http://') || url.startsWith('https://')) return url;
    return '${EndPoints.imageBaseUrl}$url';
  }

  String? _firstImageUrl() {
    final items = gallery;
    if (items != null && items.isNotEmpty) {
      // صور الأولوية: العناصر اللي نوعها image
      for (final g in items) {
        if (g is Map && g['type'] == 'image' && g['url'] != null) {
          return _buildImageUrl(g['url'].toString());
        }
      }
      // fallback: أي عنصر فيه url
      for (final g in items) {
        if (g is Map && g['url'] != null) {
          return _buildImageUrl(g['url'].toString());
        }
      }
    }
    return _buildImageUrl(diagram);
  }

  List<String> _galleryImageUrls() {
    final urls = <String>[];
    final items = gallery;
    if (items != null && items.isNotEmpty) {
      for (final g in items) {
        if (g is Map && g['type'] == 'image' && g['url'] != null) {
          urls.add(_buildImageUrl(g['url'].toString()));
        }
      }
    }
    return urls;
  }

  bool _hasPrice(dynamic value) {
    if (value == null) return false;
    // القيمة ممكن تيجي رقم أو نص من الـ API — نجرب نحوّلها ونشيل الصفر
    final number = num.tryParse(value.toString().trim());
    return number != null && number != 0;
  }

  /// ترتيب السعر: كاش ← تقسيط ← إيجار شهري ← إيجار يومي،
  /// ولو مفيش أي قيمة بيعرض «غير محدد» زي ما هو في إعلاناتي.
  String get _priceText {
    if (_hasPrice(totalPriceInCash)) return '$totalPriceInCash جنيه';
    if (_hasPrice(totalPriceInInstallment)) return '$totalPriceInInstallment جنيه';
    if (_hasPrice(monthlyRent)) return '$monthlyRent جنيه/شهر';
    if (_hasPrice(dailyRent)) return '$dailyRent جنيه/يوم';
    return 'غير محدد';
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

  Widget _buildLogoPlaceholder() {
    final url = _buildImageUrl(diagram);
    if (url.isEmpty) return _placeholderIcon();
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (c, _) => _placeholderIcon(),
      errorWidget: (c, _, __) => _placeholderIcon(),
    );
  }

  Widget _placeholderIcon() {
    return Container(
      color: AppColors.grayLight.withOpacity(0.5),
      child: Center(
        child: Icon(
          Icons.image_outlined,
          size: 40.sp,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final firstImageUrl = _firstImageUrl();
    final galleryImages = _galleryImageUrls();
    final safeStatus = status ?? '';
    final safeTitle = (title == null || title!.isEmpty) ? 'عقار' : title!;

    return Card(
      elevation: 2,
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: () => context.pushNamed(
          Routes.unitDetailsView,
          arguments: {"unitId": unitId},
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    firstImageUrl != null && firstImageUrl.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: firstImageUrl,
                            fit: BoxFit.cover,
                            placeholder: (c, _) => _placeholderIcon(),
                            errorWidget: (c, _, __) => _buildLogoPlaceholder(),
                          )
                        : _buildLogoPlaceholder(),

                    // تاج نوع الوحدة
                    if (typeLabel != null && typeLabel!.isNotEmpty)
                      Positioned(
                        top: 8.h,
                        right: 8.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryDark,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            typeLabel!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                    // عدد صور الجاليري
                    Positioned(
                      top: 8.h,
                      left: 8.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.photo_library_outlined,
                              size: 12,
                              color: Colors.white,
                            ),
                            Gap(4.w),
                            Text(
                              "${galleryImages.length}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // شارة «مباع»
                    if (safeStatus.toLowerCase() == 'sold')
                      Positioned(
                        bottom: 8.h,
                        right: 8.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            "مباع".tr(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
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
                              safeTitle,
                              style: AppStyles.black14SemiBold.copyWith(
                                fontSize: 16.sp,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Gap(4.h),
                            if (location != null && location!.isNotEmpty)
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 12.sp,
                                    color: Colors.grey[600],
                                  ),
                                  Gap(4.w),
                                  Expanded(
                                    child: Text(
                                      location!,
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
                            _priceText,
                            style: AppStyles.primary16Medium.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                          Gap(4.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: _getStatusColor(
                                safeStatus,
                              ).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              _getStatusText(safeStatus),
                              style: TextStyle(
                                color: _getStatusColor(safeStatus),
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
                        label: "${rooms ?? 0} غرف",
                      ),
                      Gap(8.w),
                      _InfoChip(
                        icon: Icons.bathtub_outlined,
                        label: "${bathrooms ?? 0} حمام",
                      ),
                      Gap(8.w),
                      _InfoChip(
                        icon: Icons.straighten_outlined,
                        label: "${unitArea ?? 0} م²",
                      ),
                      if (operationLabel != null &&
                          operationLabel!.isNotEmpty) ...[
                        Gap(8.w),
                        _InfoChip(
                          icon: Icons.business_outlined,
                          label: operationLabel!,
                        ),
                      ],
                    ],
                  ),
                  Gap(12.h),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => context.pushNamed(
                            Routes.unitDetailsView,
                            arguments: {"unitId": unitId},
                          ),
                          icon: const Icon(
                            Icons.visibility_outlined,
                            size: 16,
                          ),
                          label: Text("عرض".tr()),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.primaryDark,
                            side: BorderSide(color: AppColors.primaryDark),
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                      ),
                      if (featuredButton != null) ...[
                        Gap(8.w),
                        Expanded(child: featuredButton!),
                      ],
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
