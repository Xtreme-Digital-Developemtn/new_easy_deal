import 'package:easy_deal/main_imports.dart';

class UnitItem extends StatelessWidget {
  const UnitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.h,
      width: 240.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.gray1
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              ClipRRect(
                  borderRadius: BorderRadiusGeometry.only(topLeft: Radius.circular(12.r),topRight: Radius.circular(12.r)),
                  child: CustomNetWorkImage(
                      width: double.infinity,
                      height: 190.h,
                      fit: BoxFit.cover,
                      imageUrl: "https://media.istockphoto.com/id/1499019570/photo/roof-garden.jpg?s=1024x1024&w=is&k=20&c=6fNpGPOAcQ8xDZ5BmvkShZekQ-nomhgZZaMs5dXxZ5c=",
                      raduis: 0)),
              Positioned(
                top: 16.h,
                left: 16.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(SvgImages.star,height: 8.h,),
                      Gap(6.w),
                      Text("Feature",style: AppStyles.gray8Medium,),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 16.h,
                left: 90.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(SvgImages.money,height: 8.h,),
                      Gap(6.w),
                      Text("2150.50000",style: AppStyles.gray8Medium,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          Row(
            children: [
              Row(
                children: List.generate(5, (index){
                  return SvgPicture.asset(SvgImages.star,height: 14.h,);
                }),
              ),
              Gap(8.w),
              Text("5.0",style: AppStyles.gray10Medium,)
            ],
          ),

        ],
      ),
    );
  }
}
