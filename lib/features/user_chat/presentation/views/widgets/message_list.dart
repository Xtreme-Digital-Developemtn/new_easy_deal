import 'package:easy_deal/features/user_chat/presentation/views/widgets/right_message_by_me.dart';

import '../../../../../main_imports.dart';
import 'left_message_from_user.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:   EdgeInsets.all(16.r),
      children: [
        LeftMessageFromUser(),
        RightMessageByMe(),


      ],
    );
  }
}
