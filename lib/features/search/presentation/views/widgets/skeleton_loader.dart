import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../main_imports.dart';

class SkeletonLoader extends StatelessWidget {
  const SkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => Gap(12.h),
        itemBuilder: (context, index) {
          return Container(
            height: 150.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 120.w,
                  height: 150.h,
                  color: Colors.grey[200],
                ),
                Gap(12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.w,
                        height: 20.h,
                        color: Colors.grey[200],
                      ),
                      Gap(8.h),
                      Container(
                        width: 150.w,
                        height: 16.h,
                        color: Colors.grey[200],
                      ),
                      Gap(8.h),
                      Container(
                        width: 120.w,
                        height: 16.h,
                        color: Colors.grey[200],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
