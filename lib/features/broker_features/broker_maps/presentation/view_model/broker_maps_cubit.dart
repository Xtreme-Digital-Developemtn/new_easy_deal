import 'dart:io';

import 'package:easy_deal/features/broker_features/broker_maps/data/models/add_map_model.dart';

import '../../../../../main_imports.dart';
import '../../data/models/map_location_model.dart';
import '../../data/repos/broker_maps_repo.dart';
import 'broker_maps_states.dart';

class BrokerMapsCubit extends Cubit<BrokerMapsStates> {
  BrokerMapsCubit(this.brokerMapsRepo) : super(BrokerMapsInitState());

  BrokerMapsRepo? brokerMapsRepo;

  static BrokerMapsCubit get(context) => BlocProvider.of(context);

  BrokerMapsModel? mapsModel;

  Future<void> getMaps({required int brokerId}) async {
    emit(GetMapsLoadingState());
    var result = await brokerMapsRepo!.getMaps(brokerId: brokerId);
    return result.fold(
      (failure) {
        emit(GetMapsErrorState(failure.errMessage));
      },
      (data) async {
        mapsModel = data;
        emit(GetMapsSuccessState(data));
      },
    );
  }


  AddMapModel? addMapModel;

  Future<void> addMap({required File image  ,
    required String description ,
    required int brokerId
  })
  async {
    emit(AddMapLoadingState());
    var result = await brokerMapsRepo!.addMap(
        image: image,
        description: description,
        brokerId: brokerId,
    );
    return result.fold(
          (failure) {
        emit(AddMapErrorState(failure.errMessage));
      },
          (data) async {
            addMapModel = data;
        emit(AddMapSuccessState(data));
      },
    );
  }
}