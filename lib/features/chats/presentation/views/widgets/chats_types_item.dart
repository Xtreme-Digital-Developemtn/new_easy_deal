import '../../../../../main_imports.dart';
import '../../view_model/chats_cubit.dart';
import '../../view_model/chats_states.dart';

class ChatsTypesItem extends StatelessWidget {
  const ChatsTypesItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit , ChatsStates>(
      builder: (context,state){
        var chatsCubit = context.read<ChatsCubit>();
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: chatsCubit.selectedChatType == index+1
                ? AppColors.primaryDark
                : AppColors.primaryDark.withValues(alpha: 0.1),
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
            child: InkWell(
              onTap: (){
                chatsCubit.selectChatType(index+1);
              },
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                height: 30.h,
                child: Center(
                  child: Text(
                    chatsCubit.chatsTypesList[index].name,
                    style: chatsCubit.selectedChatType == index+1
                        ? AppStyles.white14Medium
                        : AppStyles.gray12Medium,
                  ),
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
