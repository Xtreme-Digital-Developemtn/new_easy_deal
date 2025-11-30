import 'package:easy_deal/core/shared_widgets/custom_button.dart';
import 'package:easy_deal/main_imports.dart';

class NotifyItem extends StatelessWidget {
  const NotifyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: double.infinity,
      color: Color.fromRGBO(12, 59, 182, 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 8.h,
                width: 8.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryDark,
                ),

              ),
              Gap(8.w),
              CustomNetWorkImage(
                  height: 50.h,
                  width: 50.w,
                  fit: BoxFit.cover,
                  imageUrl: "https://ichef.bbci.co.uk/ace/standard/976/cpsprodpb/153FD/production/_126973078_whatsubject.jpg.webp",
                  raduis: 50),
              Gap(8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Notify Type",style: AppStyles.black16SemiBold,),
                  SizedBox(
                    width: 200.w,
                    child: Text("We’re pleased to introduce the latest enhancements in our mobile app experience."
                      ,style: AppStyles.gray14Medium,
                    maxLines: 2,),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "mmm",
                          height: 32.h,
                        ),
                      ),
                      Gap(12.w),
                      Expanded(
                        child: CustomButton(
                          text: "mmm",
                          height: 32.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("2h",style: AppStyles.gray12Medium,),
              Icon(Icons.linear_scale_sharp),
            ],
          )
        ],
      ),
    );
  }
}
