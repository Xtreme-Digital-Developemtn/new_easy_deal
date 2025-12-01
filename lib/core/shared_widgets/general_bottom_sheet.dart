 import 'package:easy_deal/main_imports.dart';

class StandardBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    bool isScrollControlled = false,
    double borderRadius = 20,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(borderRadius),
        ),
      ),
      builder: (context) {
        return child;
      },
    );
  }
}




 class GeneralBottomSheet {
   static void show({
     required BuildContext context,
     required Widget image,
     required String title,
     required String description,
     required String buttonText,
     required VoidCallback onButtonPressed,
     String? secondaryButtonText,
     VoidCallback? onSecondaryButtonPressed,
     bool isDismissible = true,
     double heightRatio = 0.6,
     Color backgroundColor = Colors.white,
     double imageHeight = 120,
     bool showCloseButton = false,
   }) {
     showModalBottomSheet(
       context: context,
       isScrollControlled: true,
       backgroundColor: Colors.transparent,
       isDismissible: isDismissible,
       builder: (BuildContext context) {
         return _AdvancedBottomSheetContent(
           image: image,
           title: title,
           description: description,
           buttonText: buttonText,
           onButtonPressed: onButtonPressed,
           secondaryButtonText: secondaryButtonText,
           onSecondaryButtonPressed: onSecondaryButtonPressed,
           heightRatio: heightRatio,
           backgroundColor: backgroundColor,
           imageHeight: imageHeight,
           showCloseButton: showCloseButton,
         );
       },
     );
   }
 }

 class _AdvancedBottomSheetContent extends StatelessWidget {
   final Widget image;
   final String title;
   final String description;
   final String buttonText;
   final VoidCallback onButtonPressed;
   final String? secondaryButtonText;
   final VoidCallback? onSecondaryButtonPressed;
   final double heightRatio;
   final Color backgroundColor;
   final double imageHeight;
   final bool showCloseButton;

   const _AdvancedBottomSheetContent({
     required this.image,
     required this.title,
     required this.description,
     required this.buttonText,
     required this.onButtonPressed,
     this.secondaryButtonText,
     this.onSecondaryButtonPressed,
     required this.heightRatio,
     required this.backgroundColor,
     required this.imageHeight,
     required this.showCloseButton,
   });

   @override
   Widget build(BuildContext context) {
     return Container(
       height: MediaQuery.of(context).size.height * heightRatio,
       decoration: BoxDecoration(
         color: backgroundColor,
         borderRadius:   BorderRadius.only(
           topLeft: Radius.circular(20.0.r),
           topRight: Radius.circular(20.0.r),
         ),
       ),
       child: Padding(
         padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
         child: Column(
           children: [
             // Close Button (Optional)
             if (showCloseButton)
               Align(
                 alignment: Alignment.topRight,
                 child: IconButton(
                   onPressed: () => Navigator.pop(context),
                   icon: const Icon(Icons.close),
                 ),
               ),

             // Image
             SizedBox(height: imageHeight, child: image),

             Gap(20.h),

             // Title
             Text(
               title,
               style:   TextStyle(
                 fontSize: 22.sp,
                 fontWeight: FontWeight.bold,
                 color: Colors.black,
               ),
               textAlign: TextAlign.center,
             ),

             Gap(16.h),

             // Description
             Expanded(
               child: SingleChildScrollView(
                 child: Text(
                   description,
                   style:   TextStyle(
                     fontSize: 16.sp,
                     color: Colors.grey,
                     height: 1.5,
                   ),
                   textAlign: TextAlign.center,
                 ),
               ),
             ),

             Gap(20.h),

             // Buttons
             Column(
               children: [
                 // Primary Button
                 CustomButton(
                   width: double.infinity,
                   text: buttonText,
                   onPressed:onButtonPressed,
                 ),

                 // Secondary Button (Optional)
                 if (secondaryButtonText != null) ...[
                   Gap(12.h),
                   SizedBox(
                     width: double.infinity,
                     child: OutlinedButton(
                       onPressed: onSecondaryButtonPressed,
                       style: OutlinedButton.styleFrom(
                         padding: const EdgeInsets.symmetric(vertical: 16),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(12),
                         ),
                       ),
                       child: Text(
                         secondaryButtonText!,
                         style:   TextStyle(
                           fontSize: 16.sp,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                     ),
                   ),
                 ],
               ],
             ),
           ],
         ),
       ),
     );
   }
 }