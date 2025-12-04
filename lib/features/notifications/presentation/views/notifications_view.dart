import 'package:easy_deal/features/notifications/presentation/views/widgets/notify_item.dart';
import 'package:easy_deal/main_imports.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:GlobalAppBar(title: LangKeys.notifications),
      body: ListView.separated(
          itemBuilder: (context,index){
            return NotifyItem();
          },
          separatorBuilder: (context,index){
            return Gap(12.h);
          },
          itemCount: 10,
      ),
    );
  }
}
