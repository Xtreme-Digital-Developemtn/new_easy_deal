import 'package:easy_deal/features/notifications/presentation/views/widgets/notify_item.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.notifications.tr()),
        leading: IconButton(onPressed: (){
          context.pop();
        }, icon: SvgPicture.asset(SvgImages.arrow)),
      ),
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
