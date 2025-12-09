import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/brokers_list.dart';
import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/search_and_filter.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class AssignToBrokerView extends StatelessWidget {
  const AssignToBrokerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.assignToBroker),
      body: Padding(
        padding:   EdgeInsets.all(20.0.r),
        child: Column(
          children: [
            SearchAndFilter(),
            Gap(12.h),
            AssignBrokersList(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        color: Colors.white,
        child: CustomButton(
          onPressed: (){
            context.pushNamedAndRemoveUntil(Routes.successAssignView);
          },
          text: LangKeys.save.tr(),
        ),
      ),
    );
  }
}
