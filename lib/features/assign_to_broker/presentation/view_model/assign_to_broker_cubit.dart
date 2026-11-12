import 'package:easy_localization/easy_localization.dart';

import '../../../../core/utils/toast/toast.dart';
import '../../../../main_imports.dart';
import '../../data/models/broker_model.dart';
import '../../data/repos/assign_to_broker_repo.dart';
import 'assign_to_broker_states.dart';

class AssignToBrokerCubit extends Cubit<AssignToBrokerStates> {
  AssignToBrokerCubit(this.assignToBrokerRepo) : super(AssignToBrokerInitState());

  AssignToBrokerRepo? assignToBrokerRepo;

  static AssignToBrokerCubit get(context) => BlocProvider.of(context);

  int requestId = 0;
  int senderId = 0;

  List<BrokerModel> selectedItems = [];
  bool selectAll = false;
  List<BrokerModel> assignBrokersList = [];
  bool isLoading = false;
  String? errorMessage;

  /// بيمنع إرسال التعيين مرتين لو المستخدم دوس على الحفظ ضغطتين سريعتين.
  bool isAssigning = false;


  void setRequestId(int id) {
    requestId = id;
  }

  void setSenderId(int id) {
    senderId = id;
  }

  Future<void> getRecommendedBrokers() async {
    emit(GetRecommendedBrokersLoadingState());
    isLoading = true;
    errorMessage = null;

    var result = await assignToBrokerRepo!.getRecommendedBrokers(requestId);
    return result.fold(
      (failure) {
        isLoading = false;
        errorMessage = failure.errMessage;
        emit(GetRecommendedBrokersErrorState(failure.errMessage));
      },
      (brokers) {
        isLoading = false;
        errorMessage = null;
        assignBrokersList = brokers;
        selectedItems.clear();
        selectAll = false;
        emit(GetRecommendedBrokersSuccessState());
      },
    );
  }

  void toggleItemSelection(BrokerModel item) {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
      selectAll = assignBrokersList.isNotEmpty &&
          selectedItems.length == assignBrokersList.length;

    emit(ToggleItemSelectionState());
  }

  void toggleSelectAll() {
      if (assignBrokersList.isEmpty) return;

      if (selectAll) {
        selectedItems.clear();
      } else {
        selectedItems = List.from(assignBrokersList);
      }
      selectAll = !selectAll;

    emit(ToggleSelectAllState());
  }

  Future<void> assignToBrokers(BuildContext context) async {
    // ضغطتين سريعتين على الحفظ لازم يعملوا تعيين واحد بس.
    if (isAssigning) return;

    // من غير أي وسيط محدد مفيش طلب بيتبعت، ورسالة بتوضح للمستخدم.
    if (selectedItems.isEmpty) {
      Toast.showErrorToast(msg: LangKeys.selectItemsFirst.tr(), context: context);
      return;
    }

    isAssigning = true;
    emit(AssignBrokersLoadingState());

    final brokerIds = selectedItems.map((b) => b.id).toList();

    var result = await assignToBrokerRepo!.assignBrokers(requestId, senderId, brokerIds);
    return result.fold(
      (failure) {
        // التحديدات بتفضل زي ما هي عشان المستخدم يعيد المحاولة.
        isAssigning = false;
        emit(AssignBrokersErrorState(failure.errMessage));
        if (context.mounted) {
          Toast.showErrorToast(msg: failure.errMessage, context: context);
        }
      },
      (data) {
        isAssigning = false;
        emit(AssignBrokersSuccessState());
        context.pushNamedAndRemoveUntil(Routes.successAssignView);
      },
    );
  }
}