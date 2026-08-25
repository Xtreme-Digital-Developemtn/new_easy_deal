import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileStatistics extends StatelessWidget {
  const ProfileStatistics({
    super.key,
    required this.adsCount,
    required this.opsCount,
    required this.locationsCount,
    required this.specialtyCount,
  });

  final int adsCount;
  final int opsCount;
  final int locationsCount;
  final int specialtyCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 14.h,
      ),
      child: Row(
        children: [
          Expanded(
            child: ProfileStatisticCard(
              icon: Icons.description_outlined,
              count: adsCount,
              title: 'Ads',
            ),
          ),

          SizedBox(width: 8.w),

          Expanded(
            child: ProfileStatisticCard(
              icon: Icons.show_chart_rounded,
              count: opsCount,
              title: 'Ops',
            ),
          ),

          SizedBox(width: 8.w),

          Expanded(
            child: ProfileStatisticCard(
              icon: Icons.location_on_outlined,
              count: locationsCount,
              title: 'Locations',
            ),
          ),

          SizedBox(width: 8.w),

          Expanded(
            child: ProfileStatisticCard(
              icon: Icons.workspace_premium_outlined,
              count: specialtyCount,
              title: 'Specialty',
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileStatisticCard extends StatelessWidget {
  const ProfileStatisticCard({
    super.key,
    required this.icon,
    required this.count,
    required this.title,
  });

  final IconData icon;
  final int count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 128.h,
      padding: EdgeInsets.symmetric(
        horizontal: 6.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8FA),
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: const Color(0xFFD9DCE5),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Icon Circle
          Container(
            width: 32.w,
            height: 32.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE9ECF5),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF2E3C73),
              size: 16.sp,
            ),
          ),

          /// Count
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF222222),
            ),
          ),

          /// Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF6E6E73),
            ),
          ),
        ],
      ),
    );
  }
}