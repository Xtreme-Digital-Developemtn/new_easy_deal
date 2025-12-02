import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class MessageInput extends StatelessWidget {
  const MessageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:   EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.r,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.emoji_emotions_outlined),
            color: Colors.grey[700],
          ),
          Expanded(
            child: Container(
              padding:   EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: const Color(0xffF0F2F5),
                borderRadius: BorderRadius.circular(25),
              ),
              child:   TextField(
                decoration: InputDecoration(
                  hintText: LangKeys.typeMessage.tr(),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          Gap(8.w),

            CircleAvatar(
            radius: 22.r,
            backgroundColor: Color(0xffE8ECF1),
            child: Icon(Icons.attach_file, color: Colors.black87),
          ),
          Gap(8.w),

            CircleAvatar(
            radius: 22.r,
            backgroundColor: AppColors.primaryDark,
            child: Icon(Icons.mic, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
