import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/category_item.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class BrokerCategories extends StatelessWidget {
  const BrokerCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BrokerCategoryItem(svgImage: SvgImages.developers, title: LangKeys.developers,onTap: (){
              context.pushNamed(Routes.brokerDevelopersView);
            },),
            Gap(12.w),
            BrokerCategoryItem(svgImage: SvgImages.myData, title: LangKeys.myData),
          ],
        ),
        Gap(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BrokerCategoryItem(svgImage: SvgImages.ads, title: LangKeys.myAds),
            Gap(12.w),
            BrokerCategoryItem(svgImage: SvgImages.map2, title: LangKeys.maps),
          ],
        ),
      ],
    );
  }
}
