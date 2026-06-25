import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';
import '../models/send_fcm_model.dart';
import '../models/un_read_notifications_count_model.dart';
import 'layout_repo.dart';



class LayoutRepoImpl implements LayoutRepo {
  final ApiService? apiService;
  LayoutRepoImpl(this.apiService);




  @override
  Future<Either<Failure, SendFcmModel>> sendFcmToken({required String fcmToken}) async{
    try {
      var data = json.encode({
        "fcm_token": fcmToken
      });
      var response = await apiService!.postData(
        endPoint: EndPoints.brokerFcmToken,
    data: data
      );
      SendFcmModel result = SendFcmModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }




  @override
  Future<Either<Failure, UnReadNotificationsCountModel>> getUnReadNotificationsCount() async{
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.brokerNotificationsCount,
      );
      UnReadNotificationsCountModel result = UnReadNotificationsCountModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }



}