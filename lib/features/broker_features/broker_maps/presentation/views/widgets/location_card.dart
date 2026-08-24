import 'package:easy_localization/easy_localization.dart';
import '../../../../../../main_imports.dart';
import '../../../data/models/map_location_model.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
    required this.location,
    this.onOpenMap,
  });

  final MapItem location;
  final VoidCallback? onOpenMap;

  @override
  Widget build(BuildContext context) {
    final imageUrl = location.imageUrl?.url ?? location.fileUrl;
    final hasImage = imageUrl != null && imageUrl.isNotEmpty;

    // عدل أسماء الـ fields حسب الـ MapItem عندك
    final title = location.description ?? 'بدون وصف'.tr();

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
                if (hasImage)
                  CachedNetworkImage(
                    imageUrl: imageUrl,
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

                /// Location Pin
                Center(
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 58.sp,
                    color: const Color(0xFF233A75),
                  ),
                ),



                /// Open image on tap
                if (hasImage)
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => _showImageDialog(context, imageUrl),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title + Star
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppStyles.black14SemiBold.copyWith(
                          fontSize: 16.sp,
                          color: const Color(0xFF263238),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),


                  ],
                ),

              ],
            ),
          ),
        ],
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

  /// الإحداثيات
  ///
  /// عدل الجزء ده حسب أسماء الـ fields الموجودة في MapItem
  String _getCoordinates() {
    // مثال مؤقت:
    return '30.0444° N, 31.2357° E';

    /*
    لو عندك:
    final lat = location.latitude;
    final lng = location.longitude;

    if (lat != null && lng != null) {
      return '${lat.toStringAsFixed(4)}° N, '
          '${lng.toStringAsFixed(4)}° E';
    }

    return 'No coordinates';
    */
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
              InteractiveViewer(
                minScale: 0.5,
                maxScale: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.contain,
                    placeholder: (_, __) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorWidget: (_, __, ___) {
                      return const Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 64,
                          color: Colors.grey,
                        ),
                      );
                    },
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