import '../../../../../main_imports.dart';

class UnitImageTypeLocation extends StatelessWidget {
  const UnitImageTypeLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return     Container(
    color: Colors.transparent,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          CustomNetWorkImage(
              width: double.infinity,
              height: 300.h,
              fit: BoxFit.cover,
              imageUrl: "https://media.istockphoto.com/id/1499019570/photo/roof-garden.jpg?s=1024x1024&w=is&k=20&c=6fNpGPOAcQ8xDZ5BmvkShZekQ-nomhgZZaMs5dXxZ5c=",
              raduis: 12.r),
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
            bottom: 50.h,
            left: 16.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.primaryDark,
              ),
              child: Text("Apartment",style: AppStyles.white12Medium,),
            ),
          ),
          Positioned(
            bottom: 25.h,
            left: 16.w,
            child: Row(
              children: [
                Text("Marasem, New Cairo",style: AppStyles.white14SemiBold,),
                Gap(4.w),
                SvgPicture.asset(SvgImages.verified),
              ],
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 16.w,
            child: Text("Marasem, New Cairo",style: AppStyles.white10Regular,),
          ),
        ],
      ),
    );
  }
}
