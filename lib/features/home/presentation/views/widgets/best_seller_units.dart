import 'package:easy_deal/features/home/presentation/views/widgets/unit_item.dart';
import 'package:easy_deal/main_imports.dart';

class BestSellerUnits extends StatelessWidget {
  const BestSellerUnits({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:    EdgeInsets.symmetric(horizontal: 12.w),
      child: SizedBox(
        height: 230.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return UnitItem();
            },
            separatorBuilder: (context,index){
              return Gap(12.w);
            },
            itemCount: 10,
        ),
      ),
    );
  }
}
