import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class UnitInformation extends StatelessWidget {
  const UnitInformation({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> infoNames = ["bed", "bath", "sqft", "area", "pool", "built"];
    List<String> infoValues = ["1", "3", "7", "2000", "0", "1900"];

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
          Text(
            LangKeys.unitInformation.tr(),
            style: AppStyles.blueDark14Bold,
          ),
          Gap(16.h),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 1.2,
            ),
            itemCount: infoNames.length,
            itemBuilder: (context, index) {
              return _buildInfoItem(
                name: infoNames[index],
                value: infoValues[index],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({required String name, required String value}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: AppStyles.blueDark16Bold,
          ),
          SizedBox(height: 4.h),
          Text(
            name,
            style: AppStyles.gray12Medium,
          ),
        ],
      ),
    );
  }


}