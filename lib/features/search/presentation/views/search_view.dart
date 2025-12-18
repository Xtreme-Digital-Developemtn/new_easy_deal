import 'package:easy_deal/core/shared_widgets/container_search_widget.dart';
import 'package:easy_deal/features/home/presentation/views/widgets/unit_item.dart';
import 'package:easy_deal/main_imports.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding:   EdgeInsets.all(12.r),
        child: Column(
          children: [
            ContainerSearchWidget(),
            Gap(20.h),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index){
                    return UnitItem(unitId: 1,);
                  },
                  separatorBuilder: (context,index){
                    return Gap(12.h);
                  },
                  itemCount: 10,
              ),
            )
          ],

        ),
      )),
    );
  }
}
