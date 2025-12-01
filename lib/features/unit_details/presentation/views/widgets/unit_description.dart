import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class UnitDescription extends StatelessWidget {
  const UnitDescription({super.key});

  @override
  Widget build(BuildContext context) {
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
          Text(LangKeys.propertyDetails.tr(),style: AppStyles.blueDark14Bold,),
          Gap(16.h),
          Text("des"*100),
        ],
      ),
    );
  }
}
