import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class UnitFeatures extends StatelessWidget {
  const UnitFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> featuresList = ["Equipped Kitchen", "Back yard", "Media Room", "Gym", "Media Room", "Garage Attached"];
    return Container(
      padding: EdgeInsets.all(12.r),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.gray1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LangKeys.features.tr(),style: AppStyles.blueDark14Bold,),
          Gap(16.h),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 6,
            ),
            itemCount: featuresList.length,
            itemBuilder: (context, index) {
              return Text(featuresList[index],style: AppStyles.black14Medium,);
            },
          )
        ],
      ),
    );
  }
}
