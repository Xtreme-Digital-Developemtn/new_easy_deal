import 'package:easy_deal/features/user_chat/presentation/views/widgets/message_input.dart';
import 'package:easy_deal/features/user_chat/presentation/views/widgets/message_list.dart';
import 'package:easy_deal/main_imports.dart';

class UserChatView extends StatelessWidget {
  const UserChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CustomNetWorkImage(
              imageUrl: "https://i.pravatar.cc/150?img=52",
              height: 40.h,
              width: 40.w,
              raduis: 50,
            ),
            Gap(10.w),
            Text("Ahmed", style: AppStyles.black16SemiBold),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: MessageList()),
          MessageInput(),
        ],
      ),
    );
  }




}
