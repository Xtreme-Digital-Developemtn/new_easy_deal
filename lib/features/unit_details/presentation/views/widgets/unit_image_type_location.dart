import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/shared_widgets/unit_gallery_dialog.dart';
import '../../../../../main_imports.dart';

class UnitImageTypeLocation extends StatefulWidget {
  const UnitImageTypeLocation({
    super.key,
    this.gallery,
    this.rawData,
    this.diagram,
    this.apartment,
    this.city,
    this.area,
    this.subArea,
    this.otherSubAreas,
  });

  final List<dynamic>? gallery;
  final Map<String, dynamic>? rawData;
  final String? diagram;
  final String? apartment;
  final String? city;
  final String? area;
  final String? subArea;
  final List<dynamic>? otherSubAreas;

  @override
  State<UnitImageTypeLocation> createState() => _UnitImageTypeLocationState();
}

class _UnitImageTypeLocationState extends State<UnitImageTypeLocation> {
  int _current = 0;
  late final PageController _pageController = PageController();

  String _buildImageUrl(String? url) {
    if (url == null || url.isEmpty) return '';
    if (url.startsWith('http://') || url.startsWith('https://')) return url;
    final base = EndPoints.imageBaseUrl.endsWith('/')
        ? EndPoints.imageBaseUrl.substring(0, EndPoints.imageBaseUrl.length - 1)
        : EndPoints.imageBaseUrl;
    final path = url.startsWith('/') ? url : '/$url';
    return '$base$path';
  }

  List<String> _imageUrls() {
    final urls = <String>[];
    var items = widget.gallery;
    if ((items == null || items.isEmpty) && widget.rawData != null) {
      for (final key in ['gallery', 'images', 'photos', 'imageList']) {
        final v = widget.rawData![key];
        if (v is List && v.isNotEmpty) {
          items = v;
          break;
        }
      }
    }
    if (items != null && items.isNotEmpty) {
      for (final g in items) {
        String? url;
        if (g is Map) {
          for (final key in ['url', 'image', 'path', 'src', 'file']) {
            if (g[key] != null && g[key].toString().trim().isNotEmpty) {
              url = g[key].toString();
              break;
            }
          }
        } else if (g is String) {
          url = g;
        }
        if (url != null && url.trim().isNotEmpty) {
          final built = _buildImageUrl(url.trim());
          if (built.isNotEmpty) urls.add(built);
        }
      }
    }
    if (urls.isEmpty && widget.diagram != null && widget.diagram!.trim().isNotEmpty) {
      final built = _buildImageUrl(widget.diagram!.trim());
      if (built.isNotEmpty) urls.add(built);
    }
    return urls;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = _imageUrls();
    return Container(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          SizedBox(
            width: double.infinity,
            height: 300.h,
            child: images.isEmpty
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.gray1,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image_outlined,
                        size: 40.sp,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () => showUnitGalleryDialog(context, images),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: images.length,
                      onPageChanged: (i) => setState(() => _current = i),
                      itemBuilder: (context, index) {
                        return CustomNetWorkImage(
                          imageUrl: images[index],
                          raduis: 12.r,
                          width: double.infinity,
                          height: 300.h,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 90.h,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.55),
                    Colors.black.withValues(alpha: 0.25),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          if (images.length > 1)
            Positioned(
              top: 8.h,
              left: 8.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  '${_current + 1} / ${images.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          if (widget.apartment != null)
            Positioned(
              bottom: 50.h,
              left: context.isArabic ? null : 16.w,
              right: context.isArabic ? 16.w : null,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.primaryDark,
                ),
                child: Text(widget.apartment!, style: AppStyles.white12Medium),
              ),
            ),
          Positioned(
            bottom: 25.h,
            left: context.isArabic ? null : 16.w,
            right: context.isArabic ? 16.w : null,
            child: Row(
              children: [
                Text(
                  widget.city ?? LangKeys.notAvailable.tr(),
                  style: AppStyles.white14SemiBold,
                ),
                Gap(4.w),
                SvgPicture.asset(SvgImages.verified),
              ],
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: context.isArabic ? null : 16.w,
            right: context.isArabic ? 16.w : null,
            child: Row(
              children: [
                Text(
                  widget.area ?? LangKeys.notAvailable.tr(),
                  style: AppStyles.white10Regular,
                ),
                Gap(4.w),
                Text(
                  widget.subArea ?? LangKeys.notAvailable.tr(),
                  style: AppStyles.white10Regular,
                ),
                if (widget.otherSubAreas != null && widget.otherSubAreas!.isNotEmpty) ...[
                  Gap(4.w),
                  Text(
                    widget.otherSubAreas!
                        .map((e) {
                          if (e is Map) {
                            final isAr = context.isArabic;
                            final name = isAr
                                ? (e['nameAr'] ?? e['name_ar'] ?? e['name'])
                                : (e['nameEn'] ?? e['name_en'] ?? e['name']);
                            return name?.toString() ?? '';
                          }
                          return e.toString();
                        })
                        .where((e) => e.trim().isNotEmpty)
                        .join('، '),
                    style: AppStyles.white10Regular,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}