import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class NotifyItem extends StatelessWidget {
  const NotifyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: double.infinity,
      height: 150.h,
      color: Color.fromRGBO(12, 59, 182, 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 8.h,
                width: 8.w,
                margin: EdgeInsets.only(top: 6.h), // Align with text
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryDark,
                ),
              ),
              Gap(6.w),
              CustomNetWorkImage(
                height: 50.h,
                width: 50.w,
                fit: BoxFit.cover,
                imageUrl:
                "https://ichef.bbci.co.uk/ace/standard/976/cpsprodpb/153FD/production/_126973078_whatsubject.jpg.webp",
                raduis: 50,
              ),
              Gap(6.w),
              SizedBox(
                width: 200.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Notify Type",
                      style: AppStyles.black16SemiBold,
                    ),
                    Text(
                      "We're pleased to introduce the latest enhancements in our mobile app experience.",
                      style: AppStyles.gray14Medium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(80, 32),
                              maximumSize: Size(80, 32),
                              backgroundColor: AppColors.primaryLight,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Text(LangKeys.accept.tr(),style: AppStyles.white12Medium,),
                          ),
                        ),
                        Gap(6.w),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(80, 32),
                              maximumSize: Size(80, 32),
                              backgroundColor: AppColors.errorLight,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Text(LangKeys.accept.tr(),style: AppStyles.white12Medium,),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("2h", style: AppStyles.gray12Medium),
              Icon(Icons.linear_scale_sharp, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}