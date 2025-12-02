import 'package:easy_deal/features/chats/presentation/view_model/chats_cubit.dart';
import 'package:easy_deal/features/chats/presentation/view_model/chats_states.dart';
import 'package:easy_deal/main_imports.dart';

import 'chats_types_item.dart';

class ChatsTypes extends StatelessWidget {
  const ChatsTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit , ChatsStates>(
      builder: (context,state){
        var chatsCubit = context.read<ChatsCubit>();
        return SizedBox(
          height: 30.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return ChatsTypesItem(index: index,);
            },
            separatorBuilder:  (context,index){
              return Gap(8.w);
            },
            itemCount: chatsCubit.chatsTypesList.length,
          ),
        );
      },

    );
  }
}
