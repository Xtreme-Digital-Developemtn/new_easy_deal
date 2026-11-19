import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/utils/media_url.dart';
import '../../../../../../core/utils/toast/toast.dart';
import '../../../../../../main_imports.dart';
import '../../../data/models/map_location_model.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
    required this.location,
  });

  final MapItem location;

  @override
  Widget build(BuildContext context) {
    // السيرفر ساعات بيرجّع مسار نسبي، فلازم يتحوّل لرابط كامل قبل العرض،
    // وإلا الصورة بتفضل فاضية من غير سبب ظاهر.
    final rawUrl = location.imageUrl?.url ?? location.fileUrl;
    final mediaUrl = buildMediaUrl(rawUrl);
    final hasMedia = mediaUrl.isNotEmpty;
    final isPdf = isPdfMedia(url: mediaUrl, type: location.imageUrl?.type);

    final description = location.description?.trim() ?? '';
    final title =
        description.isEmpty ? LangKeys.noDescription.tr() : description;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          // الكارت ده ملف خريطة مش موقع: الصورة بتتفتح بالزوم، والـ PDF
          // بيتفتح في تطبيق خارجي لأنه مش بيتعرض كصورة.
          onTap: !hasMedia
              ? null
              : isPdf
                  ? () => _openExternally(context, mediaUrl)
                  : () => _showImageDialog(context, mediaUrl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// =========================
              /// MAP / IMAGE HEADER
              /// =========================
              SizedBox(
                height: 160.h,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    /// Background
                    if (hasMedia && !isPdf)
                      CachedNetworkImage(
                        imageUrl: mediaUrl,
                        fit: BoxFit.cover,
                        placeholder: (_, __) => _buildMapBackground(),
                        errorWidget: (_, __, ___) => _buildMapBackground(),
                      )
                    else
                      _buildMapBackground(),

                    /// Overlay
                    Container(
                      color: const Color(0xFFEDF2FA).withValues(alpha: 0.25),
                    ),

                    /// أيقونة وسط الكارت: ملف PDF أو دبوس الخريطة.
                    if (isPdf)
                      Center(
                        child: Icon(
                          Icons.picture_as_pdf_outlined,
                          size: 58.sp,
                          color: const Color(0xFF233A75),
                        ),
                      )
                    else if (!hasMedia)
                      Center(
                        child: Icon(
                          Icons.location_on_outlined,
                          size: 58.sp,
                          color: const Color(0xFF233A75),
                        ),
                      ),

                    /// إشارة إن الملف بيتفتح لما تضغط عليه.
                    if (hasMedia)
                      Positioned(
                        top: 8.h,
                        left: 8.w,
                        child: CircleAvatar(
                          radius: 16.r,
                          backgroundColor: Colors.black45,
                          child: Icon(
                            isPdf ? Icons.open_in_new : Icons.zoom_out_map,
                            size: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              /// =========================
              /// CARD DETAILS
              /// =========================
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 16.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppStyles.black14SemiBold.copyWith(
                          fontSize: 16.sp,
                          color: const Color(0xFF263238),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Gap(8.w),
                    Icon(
                      isPdf ? Icons.picture_as_pdf_outlined : Icons.image_outlined,
                      size: 20.sp,
                      color: AppColors.blueDark,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// شكل الخلفية في حالة عدم وجود صورة
  Widget _buildMapBackground() {
    return Container(
      color: const Color(0xFFE8F0FA),
      child: CustomPaint(
        painter: _GridPainter(),
      ),
    );
  }

  Future<void> _openExternally(BuildContext context, String url) async {
    final uri = Uri.tryParse(url);
    var opened = false;
    if (uri != null) {
      try {
        opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
      } catch (_) {
        opened = false;
      }
    }
    if (!opened && context.mounted) {
      Toast.showErrorToast(
        msg: LangKeys.cannotOpenFile.tr(),
        context: context,
      );
    }
  }

  void _showImageDialog(BuildContext context, String url) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(16.r),
          child: Stack(
            children: [
              /// الصورة لازم تاخد مساحة محدّدة، وإلا الـ Dialog بيطلع فاضي
              /// لما الصورة لسه بتحمّل أو لما تفشل.
              SizedBox(
                width: double.infinity,
                height: 0.7.sh,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: InteractiveViewer(
                    minScale: 0.5,
                    maxScale: 5,
                    child: CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.contain,
                      placeholder: (_, __) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                          ),
                        );
                      },
                      errorWidget: (_, __, ___) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.broken_image_outlined,
                                size: 64.sp,
                                color: AppColors.white,
                              ),
                              Gap(12.h),
                              Text(
                                LangKeys.cannotLoadImage.tr(),
                                textAlign: TextAlign.center,
                                style: AppStyles.black14Medium.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 8.h,
                right: 8.w,
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// =========================
/// MAP GRID BACKGROUND
/// =========================
class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFCED9EA)
      ..strokeWidth = 1;

    const spacing = 14.0;

    for (double x = 0; x <= size.width; x += spacing) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    for (double y = 0; y <= size.height; y += spacing) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
