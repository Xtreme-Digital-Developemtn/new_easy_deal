import 'package:easy_deal/features/chats/presentation/view_model/chats_cubit.dart';
import 'package:easy_deal/features/chats/presentation/view_model/chats_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/shared_widgets/empty_widget.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ChatsCubit , ChatsStates>(
        builder: (context,state){
          var chatsCubit = context.read<ChatsCubit>();
          return chatsCubit.selectedChatType==1 ? ListView.separated(
            itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  context.pushNamed(Routes.userChatView);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.w,
                        ),
                      ),
                      child: ClipOval(
                        child: CustomNetWorkImage(
                          imageUrl: "https://wallpapers.com/images/featured-full/cool-profile-picture-87h46gcobjl5e4xu.jpg",
                          height: 50.h,
                          width: 50.w,
                          fit: BoxFit.cover,
                          raduis: 0,
                        ),
                      ),
                    ),
                    Gap(12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mostafa Bahr",style: AppStyles.primary16SemiBold,),
                          Text("Are you ready for today’s part.."*10,style: AppStyles.black12Medium,
                            maxLines: 1,overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ),
                    Gap(12.w),
                    Text("02 feb",style: AppStyles.gray14Medium),
                  ],
                ),
              );
            },
            separatorBuilder: (context,index){
              return  Divider(
                color: Color.fromRGBO(213, 224, 252, 1),
                height: 30.h,
              );
            },
            itemCount: 10,
          ) :
          chatsCubit.selectedChatType==2 ?   EmptyWidget(msg: LangKeys.noUsersFound.tr(),) :
          EmptyWidget(msg: LangKeys.noGroupsFound.tr(),);
        },

      ),
    );
  }
}
