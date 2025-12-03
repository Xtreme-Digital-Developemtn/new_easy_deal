import 'package:easy_deal/core/shared_cubits/lang_cubit/lang_cubit.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import 'language_selection_bottom_sheet.dart';

class Language  extends StatelessWidget {
  const Language ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
     builder: (context, currentLocale){
       final currentLang = currentLocale.languageCode == 'ar' ? 'العربية' : 'English';
       return Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
             LangKeys.language.tr(),
             style: AppStyles.black16SemiBold,
           ),
           Gap(12.h),
           InkWell(
             onTap: (){
               showLanguageBottomSheet(context, currentLocale);
             },
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   children: [
                     SvgPicture.asset(SvgImages.lang),
                     Gap(8.w),
                     Text(LangKeys.language.tr(), style: AppStyles.black12Medium),
                   ],
                 ),
                 Row(
                   children: [
                     Text(currentLang, style: AppStyles.gray14Medium),
                     Gap(8.w),
                     SvgPicture.asset(SvgImages.arrowLeft),
                   ],
                 ),
               ],
             ),
           ),
         ],
       );
     },
    );
  }
}
