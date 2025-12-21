import 'package:easy_deal/features/broker_features/broker_home/presentation/view_model/broker_home_states.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/category_item.dart';
import 'package:easy_deal/main_imports.dart';

import '../../view_model/broker_home_cubit.dart';

class BrokerCategories extends StatelessWidget {
  const BrokerCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrokerHomeCubit , BrokerHomeStates>(
      builder: (context,state){
        var brokerHomeCubit = context.read<BrokerHomeCubit>();
        return Column(
          children: [
            BrokerCategoryItem(svgImage: SvgImages.search, title: LangKeys.startNewRequest,onTap: (){
              context.pushNamed(Routes.createRequestView);
              brokerHomeCubit.selectCategoryItem(0);
            },
              isSelected: brokerHomeCubit.selectedCategoryIndex==0,
            ),
            Gap(12.h),
            BrokerCategoryItem(svgImage: SvgImages.developers, title: LangKeys.developers,onTap: (){
             context.pushNamed(Routes.brokerDevelopersView);
              brokerHomeCubit.selectCategoryItem(1);
            },
              isSelected: brokerHomeCubit.selectedCategoryIndex==1,
            ),
            Gap(12.h),
            BrokerCategoryItem(svgImage: SvgImages.myData, title: LangKeys.myData,
              onTap: (){
              context.pushNamed(Routes.brokerDataView);
                brokerHomeCubit.selectCategoryItem(2);
              },
              isSelected: brokerHomeCubit.selectedCategoryIndex==2,
            ),
            Gap(12.h),
            BrokerCategoryItem(svgImage: SvgImages.ads, title: LangKeys.myAds,
              onTap: (){
               context.pushNamed(Routes.brokerAdsView);
                brokerHomeCubit.selectCategoryItem(3);
              },
              isSelected: brokerHomeCubit.selectedCategoryIndex==3,),
            Gap(12.h),
            BrokerCategoryItem(svgImage: SvgImages.map2, title: LangKeys.maps,
              onTap: (){
               context.pushNamed(Routes.brokerMapsView);
                brokerHomeCubit.selectCategoryItem(4);
              },
              isSelected: brokerHomeCubit.selectedCategoryIndex==4,),
          ],
        );
      },

    );
  }
}
