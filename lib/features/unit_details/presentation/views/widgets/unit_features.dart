import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class UnitFeatures extends StatelessWidget {
  const UnitFeatures({super.key, this.otherAccessories});

  final List<String>? otherAccessories;

  @override
  Widget build(BuildContext context) {
    // قائمة فاضية = زي ما تكون null: تظهر «لا يوجد» مش شبكة فاضية
    final cleaned = otherAccessories
            ?.where((e) => e.trim().isNotEmpty)
            .toList() ??
        const <String>[];
    final List<String> featuresList =
        cleaned.isEmpty ? [LangKeys.notAvailable.tr()] : cleaned;
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
