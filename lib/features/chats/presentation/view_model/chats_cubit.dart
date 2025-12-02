import 'package:easy_localization/easy_localization.dart';

import '../../../../main_imports.dart';
import '../../data/models/chat_type_model.dart';
import '../../data/repos/chats_repo.dart';
import 'chats_states.dart';

class ChatsCubit extends Cubit<ChatsStates> {
  ChatsCubit(this.chatsRepo) : super(ChatsInitState());

  ChatsRepo? chatsRepo;

  static ChatsCubit get(context) => BlocProvider.of(context);


  List<ChatTypeModel> chatsTypesList = [
    ChatTypeModel(id: 1, name: LangKeys.chats.tr(), value: 'chats'),
    ChatTypeModel(id: 2, name: LangKeys.users.tr(), value: 'users'),
    ChatTypeModel(id: 3, name: LangKeys.groups.tr(), value: 'groups'),
  ];

  int selectedChatType = 1;
  selectChatType(type){
    selectedChatType = type;
    emit(SelectChatTypeState());
  }

}