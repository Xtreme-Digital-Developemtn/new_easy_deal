import 'package:easy_deal/features/home/presentation/view_model/home_cubit.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import 'latest_articles_item.dart';

class LatestArticles extends StatelessWidget {
  const LatestArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: 12.r,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LangKeys.latestArticles.tr(),style: AppStyles.black16SemiBold,),
          Gap(8.h),
          SizedBox(
            height: 300.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return LatestArticlesItem(index: index,);
                },
                separatorBuilder: (context,index){
                  return Gap(12.w);
                },
                itemCount: context.read<HomeCubit>().lastArticlesImages.length,
            ),
          )
      ],),
    );
  }
}
