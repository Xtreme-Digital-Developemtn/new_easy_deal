import 'package:dartz/dartz.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/features/requests/data/repos/requests_repo.dart';
import '../../../../core/utils/enums.dart';
import '../../../../main_imports.dart';
import '../models/all_request_model.dart';


class RequestsRepoImpl implements RequestsRepo {
  final ApiService? apiService;
  RequestsRepoImpl(this.apiService);



  RequestType currentType = RequestType.sent;
  @override
  Future<Either<Failure, AllRequestModel>> getAllRequests({
    required int limit,
    required int offset,
    required RequestType type,
    required BuildContext context,
  }) async {
    try {
      final Map<String, dynamic> query = {
        "limit": limit,
        "offset": offset,
        "sort": "desc",
        "sortBy": "id",
      };

      switch (type) {
        case RequestType.sent:
          query["userId"] = context.read<ProfileCubit>().clientProfileModel!.data!.id;
          break;

        case RequestType.received:
          query["brokerId"] = context.read<ProfileCubit>().clientProfileModel!.data!.brokerId;
          break;

        case RequestType.assigned:
          query["senderId"] = context.read<ProfileCubit>().clientProfileModel!.data!.id;
          break;
      }

      var response = await apiService!.getData(
        endPoint: EndPoints.requests,
        query: query,
      );

      return right(AllRequestModel.fromJson(response.data));
    } catch (e) {
      return left(handleError(e));
    }
  }

  void changeType(RequestType type , dynamic limit , dynamic offset , BuildContext context) {
    currentType = type;
    getAllRequests(limit: limit, offset: offset, type: type,context: context);
  }






}