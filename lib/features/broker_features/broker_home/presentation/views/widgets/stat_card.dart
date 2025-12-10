import '../../../../../../main_imports.dart';

class StatCard extends StatelessWidget {
  const StatCard({super.key, required this.title, required this.subtitle, required this.count, required this.percentage, required this.mainColor, required this.lightColor, required this.icon});
  final String title;
  final String subtitle;
  final String count;
  final String percentage;
  final Color mainColor;
  final Color lightColor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: mainColor,
        boxShadow: [
          BoxShadow(
            color: mainColor.withValues(alpha: 0.2),
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 24.h,
                width: 24.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightColor,
                ),
                child: Icon(
                  icon,
                  size: 14.r,
                  color: AppColors.white,
                ),
              ),
              Gap(8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppStyles.white14SemiBold.copyWith(
                        fontSize: 11.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      subtitle,
                      style: AppStyles.white12Medium.copyWith(
                        fontSize: 9.sp,
                        color: AppColors.white.withValues(alpha: 0.8),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),

          Gap(16.h),


          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "إجمالي",
                    style: AppStyles.white12Medium.copyWith(
                      fontSize: 10.sp,
                      color: AppColors.white.withValues(alpha: 0.8),
                    ),
                  ),
                  Text(
                    count,
                    style: AppStyles.white16SemiBold.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),

              Gap(8.h),

              // Percentage
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "النسبة",
                    style: AppStyles.white12Medium.copyWith(
                      fontSize: 10.sp,
                      color: AppColors.white.withValues(alpha: 0.8),
                    ),
                  ),
                  Text(
                    percentage,
                    style: AppStyles.white14SemiBold.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),

              Gap(12.h),


              _buildAdditionalInfo(mainColor),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildAdditionalInfo(Color mainColor) {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Divider(
        height: 1.h,
        color: AppColors.white.withValues(alpha: 0.3),
      ),
      Gap(8.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "متوسط الوقت",
            style: AppStyles.white10Regular.copyWith(
              color: AppColors.white.withValues(alpha: 0.7),
            ),
          ),
          Text(
            "3 أيام",
            style: AppStyles.white14SemiBold.copyWith(
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    ],
  );
}