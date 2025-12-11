import '../../../../../../main_imports.dart';

class ChipItem extends StatelessWidget {
  const ChipItem({super.key, required this.text, required this.onRemove});
  final String text;
  final VoidCallback onRemove;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text, style: AppStyles.primary16SemiBold),
          Gap(6.w),
          GestureDetector(
            onTap: onRemove,
            child: Icon(Icons.close,
                size: 16.r, color: AppColors.primaryDark),
          ),
        ],
      ),
    );
  }
}
