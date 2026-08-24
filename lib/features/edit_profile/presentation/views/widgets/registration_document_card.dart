import 'dart:io';

import '../../../../../main_imports.dart';

enum DocumentStatus {
  approved,
  underReview,
  rejected,
}

class RegistrationDocumentCard extends StatelessWidget {
  final String title;
  final String image;
  final File? selectedImage;
  final DocumentStatus status;
  final VoidCallback? onReUpload;

  const RegistrationDocumentCard({
    super.key,
    required this.title,
    required this.image,
    this.selectedImage,
    required this.status,
    this.onReUpload,
  });

  Color get _statusColor {
    switch (status) {
      case DocumentStatus.approved:
        return const Color(0xff22C55E);
      case DocumentStatus.underReview:
        return const Color(0xffF59E0B);
      case DocumentStatus.rejected:
        return const Color(0xffEF4444);
    }
  }

  String get _statusText {
    switch (status) {
      case DocumentStatus.approved:
        return 'متوافق عليه';
      case DocumentStatus.underReview:
        return 'قيد المراجعة';
      case DocumentStatus.rejected:
        return 'مرفوض';
    }
  }

  @override
  Widget build(BuildContext context) {
    print(CacheHelper.getData(key: "userId"));
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xffD5DEFF),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الصورة الجديدة لو موجودة
              // وإلا الصورة القديمة من الـ profile
              selectedImage != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(
                  selectedImage!,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              )
                  : CustomNetWorkImage(
                imageUrl: image,
                raduis: 20,
                height: 50,
                width: 50,
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff171717),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _statusColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _statusText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 37,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onReUpload,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'إعادة رفع',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}