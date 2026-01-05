import 'package:easy_deal/main_imports.dart';

class RequestListItemSkeleton extends StatelessWidget {
  const RequestListItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: EdgeInsets.all(12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان الهيكل العظمي
          Container(
            width: double.infinity,
            height: 20.h,
            color: Colors.grey.shade300,
            margin: EdgeInsets.only(bottom: 8.h),
          ),

          Row(
            children: [
              // حالة الهيكل العظمي
              Container(
                width: 80.w,
                height: 20.h,
                color: Colors.grey.shade300,
              ),
              Spacer(),
              // تاريخ الهيكل العظمي
              Container(
                width: 60.w,
                height: 20.h,
                color: Colors.grey.shade300,
              ),
            ],
          ),

          Gap(12.h),

          // نوع الهيكل العظمي
          Container(
            width: 120.w,
            height: 20.h,
            color: Colors.grey.shade300,
            margin: EdgeInsets.only(bottom: 8.h),
          ),

          // عنوان الهيكل العظمي
          Container(
            width: double.infinity,
            height: 20.h,
            color: Colors.grey.shade300,
            margin: EdgeInsets.only(bottom: 8.h),
          ),

          // نطاق الهيكل العظمي
          Container(
            width: 150.w,
            height: 20.h,
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}