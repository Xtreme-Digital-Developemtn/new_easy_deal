//
//
// import '../../main_importants.dart';
//
// class NoDataWidget extends StatelessWidget {
//   final String image;
//   final String text;
//   const NoDataWidget({super.key, required this.image, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SvgPicture.asset(image,
//           height: 175,
//           width: 235,
//           fit: BoxFit.cover,),
//           verticalSpace(20),
//           Text(text,
//           style: const TextStyle(
//             fontWeight: FontWeight.w600,
//             color: AppColors.greyColor4,
//             fontSize: 16,
//           ),),
//         ],
//       ),
//     );
//   }
// }