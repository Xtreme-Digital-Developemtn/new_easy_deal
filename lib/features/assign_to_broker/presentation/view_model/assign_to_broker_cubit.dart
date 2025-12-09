import '../../../../main_imports.dart';
import '../../data/models/broker_model.dart';
import '../../data/repos/assign_to_broker_repo.dart';
import 'assign_to_broker_states.dart';

class AssignToBrokerCubit extends Cubit<AssignToBrokerStates> {
  AssignToBrokerCubit(this.assignToBrokerRepo) : super(AssignToBrokerInitState());

  AssignToBrokerRepo? assignToBrokerRepo;

  static AssignToBrokerCubit get(context) => BlocProvider.of(context);



  List<ItemModel> selectedItems = [];
  bool selectAll = false;
  final assignBrokersList = [
    ItemModel(
      id: '1',
      name: 'Broker 1',
      type: 'Type A',
      imageUrl:
      'https://assets-news.housing.com/news/wp-content/uploads/2022/03/28143140/Difference-between-flat-and-apartment.jpg',
    ),
    ItemModel(
      id: '2',
      name: 'Broker 2',
      type: 'Type B',
      imageUrl:
      'https://assets-news.housing.com/news/wp-content/uploads/2022/03/28143140/Difference-between-flat-and-apartment.jpg',
    ),
    ItemModel(
      id: '3',
      name: 'Broker 3',
      type: 'Type C',
      imageUrl:
      'https://assets-news.housing.com/news/wp-content/uploads/2022/03/28143140/Difference-between-flat-and-apartment.jpg',
    ),
  ];

  void toggleItemSelection(ItemModel item) {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
      selectAll = selectedItems.length == assignBrokersList.length;
      // onSelectionChanged(selectedItems);

    emit(ToggleItemSelectionState());
  }

  void toggleSelectAll() {

      if (selectAll) {
        selectedItems.clear();
      } else {
        selectedItems = List.from(assignBrokersList);
      }
      selectAll = !selectAll;
       //onSelectionChanged(selectedItems);

    emit(ToggleSelectAllState());
  }
}