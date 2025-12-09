import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class BrokerInfoSection extends StatelessWidget {
  const BrokerInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LangKeys.brokerInfo.tr(),
          style: AppStyles.black16SemiBold,
        ),
        Gap(6.h),

        /// =========  MAIN CARD =========
        Card(
          color: AppColors.blueLight,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ======== HEADER WITH IMAGE + NAME + STATUS + TYPE ========
                Row(
                  children: [
                    CustomNetWorkImage(
                      imageUrl:
                      "https://assets-news.housing.com/news/wp-content/uploads/2022/03/28143140/Difference-between-flat-and-apartment.jpg",
                      raduis: 50.r,
                      height: 50.h,
                      width: 50.w,
                      fit: BoxFit.cover,
                    ),
                    Gap(12.w),

                    /// TEXT INFO
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mostafa Bahr",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.black16SemiBold,
                          ),
                          Gap(4.h),

                          /// LAST ACTIVE DATE
                          Text(
                            "Last active: ${DateFormat('yyyy-MM-dd – hh:mm a').format(now)}",
                            style: AppStyles.gray12Medium,
                          ),
                        ],
                      ),
                    ),

                    /// TYPE + STATUS
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryDark,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            "Type A",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Gap(6.h),

                        /// STATUS
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5.r,
                              backgroundColor: Colors.green,
                            ),
                            Gap(4.w),
                            Text(
                              "Online",
                              style: AppStyles.black12Medium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                Gap(16.h),

                /// ======== DETAILS SECTION =========
                _buildDetailRow(
                  icon: Icons.location_on_outlined,
                  label: "Location",
                  value: "Cairo, Egypt",
                ),
                Gap(8.h),
                _buildDetailRow(
                  icon: Icons.star_rate_rounded,
                  label: "Rating",
                  value: "4.8 / 5",
                ),
                Gap(8.h),
                _buildDetailRow(
                  icon: Icons.work_history_outlined,
                  label: "Completed Orders",
                  value: "124 Orders",
                ),

                Gap(18.h),

                /// ======== ACTION BUTTONS ========
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.phone, size: 18.w),
                        label: Text(LangKeys.call.tr()),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primaryDark,
                          side: BorderSide(color: AppColors.primaryDark),
                        ),
                      ),
                    ),
                    Gap(8.w),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.message, size: 18.w),
                        label: Text(LangKeys.whatsapp.tr()),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.green,
                          side: BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Gap(24.h),
      ],
    );
  }

  /// Small reusable row for details
  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 18.sp, color: AppColors.primaryDark),
        Gap(8.w),
        Text(
          "$label: ",
          style: AppStyles.black14Medium,
        ),
        Expanded(
          child: Text(
            value,
            style: AppStyles.gray12Medium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
