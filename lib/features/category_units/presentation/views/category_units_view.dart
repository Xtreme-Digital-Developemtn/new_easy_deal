import 'package:easy_deal/features/category_units/presentation/views/widgets/category_units_list.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class CategoryUnitsView extends StatelessWidget {
  const CategoryUnitsView({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    final bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        leading: IconButton(onPressed: (){
          context.pop();
        }, icon: SvgPicture.asset(isArabic ? SvgImages.arrowLeft: SvgImages.arrow,
        colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),)),
      ),
      body: Padding(
        padding:   EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${LangKeys.hereIs.tr()} 458 ${LangKeys.units.tr()}",style: AppStyles.primary16SemiBold,),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(SvgImages.sort,colorFilter: ColorFilter.mode(AppColors.primaryDark,
                            BlendMode.srcIn),),
                        Gap(4.w),
                        Text(LangKeys.sort.tr(),style: AppStyles.primary16Medium,)
                      ],
                    ),
                    Gap(12.w),
                    Row(
                      children: [
                        SvgPicture.asset(SvgImages.filter,colorFilter: ColorFilter.mode(AppColors.primaryDark,
                            BlendMode.srcIn),),
                        Gap(4.w),
                        Text(LangKeys.filter.tr(),style: AppStyles.primary16Medium,)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Gap(24.h),
            CategoryUnitsList(unitId: 1,),
          ],
        ),
      ),
    );
  }
}
