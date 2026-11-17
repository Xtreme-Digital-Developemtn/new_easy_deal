import '../../../../../main_imports.dart';

/// Confirmation shown before leaving the add-property stepper with entered data.
/// Returns true when the user chose to discard and leave.
Future<bool> showApDiscardDialog(BuildContext context) async {
  final isArabic = context.isArabic;
  final result = await showDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      backgroundColor: AppColors.white,
      title: Text(
        isArabic ? 'إلغاء إضافة العقار؟' : 'Discard property?',
        style: AppStyles.black18SemiBold,
      ),
      content: Text(
        isArabic
            ? 'البيانات اللي أدخلتها مش هتتحفظ. متأكد إنك عايز تخرج؟'
            : 'The information you entered will not be saved. Leave anyway?',
        style: AppStyles.black14SemiBold.copyWith(fontWeight: FontWeight.w400),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(false),
          child: Text(
            isArabic ? 'استكمال الإضافة' : 'Keep editing',
            style: AppStyles.black14SemiBold.copyWith(color: AppColors.primaryDark),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(true),
          child: Text(
            isArabic ? 'خروج' : 'Leave',
            style: AppStyles.black14SemiBold.copyWith(color: Colors.red),
          ),
        ),
      ],
    ),
  );
  return result ?? false;
}
