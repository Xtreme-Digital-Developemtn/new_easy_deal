// import '../../main_importants.dart';
//
// class ErrorUi extends StatelessWidget {
//   const ErrorUi({super.key, required this.errorState, required this.onPressed});
//   final dynamic errorState;
//   final void Function() onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     // استخراج رسالة الخطأ بناءً على نوع errorState
//     String errorMessage = _getErrorMessage(errorState);
//
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.error_outline,
//             color: AppColors.redColor,
//             size: 64,
//           ),
//           verticalSpace(16),
//           Text(
//             'Error !!',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: AppColors.redColor,
//             ),
//           ),
//           verticalSpace(8),
//           Text(
//             errorMessage, // استخدام المتغير الجديد
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 14,
//               color: AppColors.greyColor1,
//             ),
//           ),
//           verticalSpace(16),
//           CustomButton(
//             width: 200,
//             btnText: Text(
//               "Try Again",
//               style: TextStyle(
//                 color: AppColors.whiteColor,
//                 fontSize: 18,
//               ),
//             ),
//             onPressed: onPressed,
//           ),
//         ],
//       ),
//     );
//   }
//
//   // دالة مساعدة لاستخراج رسالة الخطأ
//   String _getErrorMessage(dynamic error) {
//     if (error is String) {
//       return error; // إذا كان الخطأ نصاً، أرجع النص مباشرة
//     } else if (error is Map && error.containsKey('error')) {
//       return error['error']; // إذا كان Map به خاصية error
//     } else if (error is Exception) {
//       return error.toString(); // إذا كان Exception
//     } else {
//       return 'An unexpected error occurred'; // رسالة افتراضية
//     }
//   }
// }