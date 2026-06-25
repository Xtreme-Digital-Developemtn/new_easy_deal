
import 'package:dartz/dartz.dart';


import '../../../../main_imports.dart';
import '../models/notifications_model.dart';
import 'notifications_repo.dart';


class NotificationsRepoImpl implements NotificationsRepo {
  final ApiService? apiService;
  NotificationsRepoImpl(this.apiService);




@override
Future<Either<Failure, NotificationsModel>> getNotifications() async{
  try {
    var response = await apiService!.getData(
      endPoint: EndPoints.brokerNotifications,
    );
    NotificationsModel result = NotificationsModel.fromJson(response.data);
    return right(result);
  } catch (e) {
    return left(handleError(e));
  }
}








}