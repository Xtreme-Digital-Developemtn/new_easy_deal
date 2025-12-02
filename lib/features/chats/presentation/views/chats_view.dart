import 'package:easy_deal/core/shared_widgets/container_search_widget.dart';
import 'package:easy_deal/features/chats/presentation/views/widgets/chats_list.dart';
import 'package:easy_deal/features/chats/presentation/views/widgets/chats_types.dart';
import 'package:easy_deal/main_imports.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.all(12.0.r),
        child: Column(
          children: [
            ContainerSearchWidget(),
            Gap(16.h),
            ChatsTypes(),
            Gap(24.h),
            ChatsList(),
          ],
        ),
      )),
    );
  }
}
