import 'package:easy_deal/main_imports.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(color: AppColors.gray1,borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 40.h,
                padding: EdgeInsets.all(6.r),
                width: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.gray.withValues(alpha: 0.5),
                ),
                child: SvgPicture.asset(
                  SvgImages.house,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryDark,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Gap(12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Buy Residential", style: AppStyles.black16Medium),
                  Text(
                    "Find and purchase property",
                    style: AppStyles.gray14Medium,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward_ios, size: 16.sp),
          ),
        ],
      ),
    );
  }
}
