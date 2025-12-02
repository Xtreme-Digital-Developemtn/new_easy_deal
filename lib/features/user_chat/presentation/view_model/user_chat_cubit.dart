import 'package:easy_deal/features/user_chat/presentation/view_model/user_chat_states.dart';
import '../../../../main_imports.dart';
import '../../data/repos/user_repo.dart';

class UserChatCubit extends Cubit<UserChatStates> {
  UserChatCubit(this.userChatRepo) : super(UserChatInitState());

  UserChatRepo? userChatRepo;

  static UserChatCubit get(context) => BlocProvider.of(context);



}