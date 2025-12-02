import '../../../../../main_imports.dart';

class LeftMessageFromUser extends StatelessWidget {
  const LeftMessageFromUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : EdgeInsets.only(bottom: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetWorkImage(
                imageUrl: "https://i.pravatar.cc/150?img=52",
                height: 34.h,
                width: 34.w,
                raduis: 50.r,
              ),
              Gap(10.w),
              Expanded(
                child: Container(
                  padding:   EdgeInsets.all(14.r),
                  margin:   EdgeInsets.only(bottom: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4.r,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text("hello", style: AppStyles.black14Medium),
                ),
              ),
            ],
          ),
          Padding(
            padding:   EdgeInsets.only(left: 50.w),
            child: Text("3:14 PM"),
          ),
        ],
      ),
    );
  }
}
