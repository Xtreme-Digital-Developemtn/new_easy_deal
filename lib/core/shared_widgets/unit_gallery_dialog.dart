import 'package:easy_localization/easy_localization.dart';

import '../../main_imports.dart';

/// نافذة معاينة صور الوحدة: تنقّل بالسحب، عدّاد بيتحدّث مع كل صورة،
/// تكبير بالأصابع، وزرار إقفال.
///
/// لو مفيش صور بتعرض رسالة «لا توجد صور» بزرار «موافق».
Future<void> showUnitGalleryDialog(BuildContext context, List<dynamic> gallery) {
  if (gallery.isEmpty) {
    return showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        content: Text(LangKeys.noImages.tr(), textAlign: TextAlign.center),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(LangKeys.ok.tr()),
          ),
        ],
      ),
    );
  }

  return showDialog(
    context: context,
    builder: (_) => _UnitGalleryDialog(gallery: gallery),
  );
}

class _UnitGalleryDialog extends StatefulWidget {
  const _UnitGalleryDialog({required this.gallery});

  final List<dynamic> gallery;

  @override
  State<_UnitGalleryDialog> createState() => _UnitGalleryDialogState();
}

class _UnitGalleryDialogState extends State<_UnitGalleryDialog> {
  // الـ controller كان بيتعمل جوه الـ builder ومابيتعملوش dispose أبداً.
  late final PageController _pageController = PageController();
  int _current = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gallery = widget.gallery;
    return Dialog(
      insetPadding: EdgeInsets.all(20.w),
      child: Container(
        height: 500.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: gallery.length,
              onPageChanged: (i) => setState(() => _current = i),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(16.r),
                child: InteractiveViewer(
                  minScale: 1,
                  maxScale: 5,
                  child: CachedNetworkImage(
                    imageUrl: gallery[index].toString(),
                    fit: BoxFit.contain,
                    placeholder: (c, _) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (c, _, __) => const Icon(Icons.broken_image, size: 64),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8.h,
              right: 8.w,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.black54),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            if (gallery.length > 1)
              Positioned(
                bottom: 12.h,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      // العدّاد كان ثابت على "1 / N" مهما سحبت.
                      '${_current + 1} / ${gallery.length}',
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
