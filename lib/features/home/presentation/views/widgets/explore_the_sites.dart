import 'package:easy_deal/features/home/presentation/views/widgets/site_item.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class ExploreTheSites extends StatelessWidget {
  const ExploreTheSites({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: 12.r,vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LangKeys.exploreTheSites.tr(),style: AppStyles.black16SemiBold,),
          Gap(8.h),
          SizedBox(
            height: 120.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                return SiteItem();
                },
                separatorBuilder: (context,index){
                return Gap(12.w);
                },
                itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
