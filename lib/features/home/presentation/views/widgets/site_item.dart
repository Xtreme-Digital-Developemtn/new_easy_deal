import 'package:easy_deal/main_imports.dart';

class SiteItem extends StatelessWidget {
  const SiteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        children: [
          CustomNetWorkImage(
              width: 120.w,
              height: 120.h,
              fit: BoxFit.cover,
              imageUrl: "https://sattvagroup.com/wp-content/uploads/2024/09/flats-vs-apartment.jpg",
              raduis: 8 .r),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 90.h,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.55),
                    Colors.black.withValues(alpha: 0.25),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 25.h,
              left: 5.w,
              child: Row(
                children: [
                  SvgPicture.asset(SvgImages.location,height: 16.h,),
                  Text("New Cairo",style: AppStyles.white14SemiBold,),
                ],
              ),
          ),
          Positioned(
              bottom: 10.h,
              left: 10.w,
              child: Text("157866 Listing available",style: AppStyles.white8Regular,))
        ],
      ),
    );
  }
}
