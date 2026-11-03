import '../../main_imports.dart';

class CustomNetWorkImage extends StatelessWidget {
  const CustomNetWorkImage({
    super.key,
    required this.imageUrl,
    required this.raduis,
    this.width,
    this.height,
    this.fit,
  });
  final String imageUrl;
  final double raduis;
  final double? height;
  final double? width;
  final BoxFit? fit;
  /// بديل محايد للصورة: مستطيل رمادي وأيقونة صورة — بدل أيقونة الصورة
  /// المكسورة أو مساحة بيضا، سواء كان الرابط فاضي أو التحميل فشل.
  Widget _placeholder() {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      decoration: BoxDecoration(
        color: AppColors.gray1,
        borderRadius: BorderRadius.circular(raduis),
      ),
      child: Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          size: 32,
          color: AppColors.gray,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // رابط فاضي أو غير صالح: ما نحاولش نحمّل أصلًا
    final uri = Uri.tryParse(imageUrl);
    final bool isValidUrl = imageUrl.trim().isNotEmpty &&
        uri != null &&
        uri.hasScheme &&
        uri.host.isNotEmpty;
    if (!isValidUrl) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(raduis),
        child: _placeholder(),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(raduis),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height ?? double.infinity,
        width: width ?? double.infinity,
        fit: fit ?? BoxFit.contain,
        placeholder: (context, url) => Center(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: width ?? double.infinity,
              height: height ?? double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(raduis),
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) => _placeholder(),
      ),
    );
  }
}
