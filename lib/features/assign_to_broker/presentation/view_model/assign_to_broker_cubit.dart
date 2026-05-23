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


  void setRequestId(int id) {
    requestId = id;
  }

  void setSenderId(int id) {
    senderId = id;
  }

  Future<void> getRecommendedBrokers() async {
    emit(GetRecommendedBrokersLoadingState());
    isLoading = true;

    var result = await assignToBrokerRepo!.getRecommendedBrokers(requestId);
    return result.fold(
      (failure) {
        isLoading = false;
        emit(GetRecommendedBrokersErrorState(failure.errMessage));
      },
      (brokers) {
        isLoading = false;
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
      selectAll = selectedItems.length == assignBrokersList.length;

    emit(ToggleItemSelectionState());
  }

  void toggleSelectAll() {
      if (selectAll) {
        selectedItems.clear();
      } else {
        selectedItems = List.from(assignBrokersList);
      }
      selectAll = !selectAll;

    emit(ToggleSelectAllState());
  }

  Future<void> assignToBrokers(BuildContext context) async {
    if (selectedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select at least one broker')),
      );
      return;
    }

    emit(AssignBrokersLoadingState());

    final brokerIds = selectedItems.map((b) => b.id).toList();

    var result = await assignToBrokerRepo!.assignBrokers(requestId, senderId, brokerIds);
    return result.fold(
      (failure) {
        emit(AssignBrokersErrorState(failure.errMessage));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.errMessage)),
        );
      },
      (data) {
        emit(AssignBrokersSuccessState());
        context.pushNamedAndRemoveUntil(Routes.successAssignView);
      },
    );
  }
}