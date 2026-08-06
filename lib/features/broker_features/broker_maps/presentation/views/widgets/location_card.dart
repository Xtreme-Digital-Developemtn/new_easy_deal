import 'package:easy_localization/easy_localization.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../main_imports.dart';
import '../../../data/models/map_location_model.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key, required this.location});

  final MapItem location;

  @override
  Widget build(BuildContext context) {
    final imageUrl = location.imageUrl?.url ?? location.fileUrl;
    final hasImage = imageUrl != null && imageUrl.isNotEmpty;

    return Card(
      elevation: 2,
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: InkWell(
        onTap: hasImage ? () => _showImageDialog(context, imageUrl!) : null,
        borderRadius: BorderRadius.circular(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    hasImage
                        ? CachedNetworkImage(
                            imageUrl: imageUrl!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            placeholder: (c, _) => Container(
                              color: AppColors.grayLight,
                              child: const Center(child: CircularProgressIndicator()),
                            ),
                            errorWidget: (c, _, __) => Container(
                              color: AppColors.grayLight,
                              child: const Icon(Icons.broken_image, size: 48, color: Colors.grey),
                            ),
                          )
                        : Container(
                            color: AppColors.grayLight,
                            child: const Icon(Icons.map_outlined, size: 48, color: Colors.grey),
                          ),
                    if (hasImage)
                      Positioned(
                        bottom: 8.h,
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
                              const Icon(Icons.zoom_in_outlined, size: 14, color: Colors.white),
                              Gap(4.w),
                              Text(
                                "تكبير".tr(),
                                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                              ),



                  ]
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          location.description ?? 'بدون وصف'.tr(),
                          style: AppStyles.black14SemiBold.copyWith(fontSize: 16.sp),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (location.createdAt != null)
                        Text(
                          _formatDate(location.createdAt!),
                          style: AppStyles.gray12Medium,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),)
    ]
    )
    ));
  }

  void _showImageDialog(BuildContext context, String url) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(20.r),
        child: Stack(
          children: [
            InteractiveViewer(
              minScale: 0.5,
              maxScale: 5,
              child: CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.contain,
                placeholder: (c, _) => const Center(child: CircularProgressIndicator()),
                errorWidget: (c, _, __) => const Icon(Icons.broken_image, size: 64, color: Colors.grey),
              ),
            ),
            Positioned(
              top: 10.h,
              right: 10.w,
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return '${date.day}/${date.month}/${date.year}';
    } catch (_) {
      return dateStr;
    }
  }
}