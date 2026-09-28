import 'package:easy_deal/main_imports.dart';

class AboutUsRoundedImage extends StatelessWidget {
  const AboutUsRoundedImage({super.key, required this.image, this.height});

  final String image;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Image.asset(
        image,
        height: height ?? 170.h,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
