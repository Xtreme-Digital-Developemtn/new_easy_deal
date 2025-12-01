 import '../../../../../main_imports.dart';

class ProfileImage extends StatelessWidget {
   const ProfileImage({super.key});
 
   @override
   Widget build(BuildContext context) {
     return Stack(
       alignment: Alignment.bottomRight,
       children: [
         Container(
           padding: EdgeInsets.all(2.r),
           width: 85.w,
           height: 85.h,
           decoration: BoxDecoration(
             shape: BoxShape.circle,
             color: AppColors.primaryDark,
           ),
           child:   Container(
             height: 80.h,
             width: 80.w,
             decoration: BoxDecoration(
               shape: BoxShape.circle,
               border: Border.all(
                 color: Colors.white,
                 width: 2.w,
               ),
             ),
             child: ClipOval(
               child: CustomNetWorkImage(
                 imageUrl: "https://wallpapers.com/images/featured-full/cool-profile-picture-87h46gcobjl5e4xu.jpg",
                 height: 80.h,
                 width: 80.w,
                 fit: BoxFit.cover,
                 raduis: 0,
               ),
             ),
           ),
         ),
         Container(
           height:24.h ,
           width: 24.w ,
           decoration: BoxDecoration(
             shape: BoxShape.circle,
             color: AppColors.primaryDark
           ),
           child: Center(
             child: SvgPicture.asset(SvgImages.edit2),
           ),
         ),

       ],
     );
   }
 }
 