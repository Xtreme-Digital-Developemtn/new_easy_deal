import 'package:easy_deal/features/home/presentation/views/widgets/unit_item.dart';
import 'package:easy_deal/main_imports.dart';

class CategoryUnitsList extends StatelessWidget {
  const CategoryUnitsList({super.key, required this.unitId,});
  final int unitId;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return UnitItem();
        },
        separatorBuilder:  (context,index){
          return Gap(12.h);
        },
        itemCount: 10,
    );
  }
}
