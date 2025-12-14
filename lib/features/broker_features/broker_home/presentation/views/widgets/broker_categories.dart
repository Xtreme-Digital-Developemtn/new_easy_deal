import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/category_item.dart';
import 'package:easy_deal/main_imports.dart';

class BrokerCategories extends StatelessWidget {
  const BrokerCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BrokerCategoryItem(svgImage: SvgImages.developers, title: LangKeys.developers,onTap: (){
          context.pushNamed(Routes.brokerDevelopersView);
        },),
        Gap(12.h),
        BrokerCategoryItem(svgImage: SvgImages.myData, title: LangKeys.myData,
        onTap: (){
          context.pushNamed(Routes.brokerDataView);
        },),

        BrokerCategoryItem(svgImage: SvgImages.ads, title: LangKeys.myAds),

        BrokerCategoryItem(svgImage: SvgImages.map2, title: LangKeys.maps),
      ],
    );
  }
}
