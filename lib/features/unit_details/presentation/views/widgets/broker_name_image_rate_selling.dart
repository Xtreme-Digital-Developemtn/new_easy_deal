import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class BrokerNameImageRateSelling extends StatelessWidget {
  const BrokerNameImageRateSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(2.r),
          width: 85.w,
          height: 85.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
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
        Gap(12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Mostafa Bahr",style: AppStyles.blueDark16Bold,),
            Row(
              children: [
                Text("${LangKeys.license.tr()} : ",style: AppStyles.blueDark14Medium,),
                Text("abcdefghi",style: AppStyles.gray14Medium,),
              ],
            ),
            Row(
              children: [
                Row(
                  children: List.generate(5, (index){
                    return SvgPicture.asset(SvgImages.star,height: 10.h,);
                  }),
                ),
                Gap(6.w),
                Text("15 ${LangKeys.successSelling.tr()}",style: AppStyles.blueDark14Medium,),
              ],
            ),
          ],
        )
      ],
    );
  }
}
