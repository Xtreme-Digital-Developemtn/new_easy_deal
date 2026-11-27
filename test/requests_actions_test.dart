import 'package:dartz/dartz.dart';
import 'package:easy_deal/core/app_services/local_services/cache_helper.dart';
import 'package:easy_deal/core/errors/failure.dart';
import 'package:easy_deal/core/utils/enums.dart';
import 'package:easy_deal/features/request_details/data/models/make_unit_model.dart';
import 'package:easy_deal/features/request_details/data/models/recommended_model.dart';
import 'package:easy_deal/features/request_details/data/models/replies_model.dart';
import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/data/models/sent_responses_model.dart';
import 'package:easy_deal/features/request_details/data/models/update_status_model.dart';
import 'package:easy_deal/features/request_details/data/repos/request_repo.dart';
import 'package:easy_deal/features/requests/data/models/all_request_model.dart';
import 'package:easy_deal/features/requests/data/repos/requests_repo.dart';
import 'package:easy_deal/features/requests/presentation/view_model/requests_cubit.dart';
import 'package:easy_deal/features/requests/presentation/view_model/requests_states.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/request_list_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeRequestsRepo implements RequestsRepo {
  @override
  Future<Either<Failure, AllRequestModel>> getAllRequests({
    required int limit,
    required int offset,
    required RequestType type,
    required BuildContext context,
    Map<String, dynamic>? filters,
  }) async {
    return left(ServerFailure('unused'));
  }
}

class _FakeDetailsRepo implements RequestDetailsRepo {
  int updateCalls = 0;
  String? sentStatus;
  String? sentUserId;
  String? sentUnitId;

  @override
  Future<Either<Failure, UpdateStatusModel>> updateRequestStatus({
    required int requestId,
    required String status,
    required String userId,
    required String unitId,
  }) async {
    updateCalls++;
    sentStatus = status;
    sentUserId = userId;
    sentUnitId = unitId;
    return right(UpdateStatusModel.fromJson({
      'message': 'تم التحديث',
      'data': {'id': requestId, 'status': status},
    }));
  }

  @override
  Future<Either<Failure, RequestDetailsModel>> requestDetails({
    required int requestId,
  }) async => left(ServerFailure('unused'));

  @override
  Future<Either<Failure, SentResponsesModel>> getSentResponses({
    required int requestId,
    int? senderId,
    int? brokerId,
    int limit = 10,
    int offset = 0,
    String sort = 'desc',
    String sortBy = 'id',
  }) async => left(ServerFailure('unused'));

  @override
  Future<Either<Failure, RepliesModel>> getReplies({
    required int requestId,
    int? brokerId,
    int? senderId,
    int limit = 10,
    int offset = 0,
    String sort = 'desc',
    String sortBy = 'id',
  }) async => left(ServerFailure('unused'));

  @override
  Future<Either<Failure, MakeUnitModel>> makeUnit({
    required int requestId,
    required int brokerId,
  }) async => left(ServerFailure('unused'));

  @override
  Future<Either<Failure, RecommendedModel>> getRecommendedUnits({
    required int requestId,
    required int brokerId,
    int limit = 10,
    int offset = 0,
    String sort = 'desc',
    String sortBy = 'id',
  }) async => left(ServerFailure('unused'));
}

RequestItem _request({
  required int id,
  required String type,
  required String role,
  String status = 'new',
}) {
  return RequestItem.fromJson({
    'id': id,
    'type': type,
    'status': status,
    'title': 'عنوان',
    'user': {'id': 42, 'role': role},
  });
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({'userRole': 'client'});
    await CacheHelper.init();
  });

  test('تعيين الوسيط مخفي لطلبات البيع بس', () {
    final cubit = RequestsCubit(_FakeRequestsRepo(), _FakeDetailsRepo());
    expect(cubit.canAssignBroker(_request(id: 1, type: 'Sell', role: 'client')), isFalse);
    expect(
      cubit.canAssignBroker(_request(id: 2, type: 'Rent_out', role: 'client')),
      isTrue,
    );
  });

  test('حفظ في العقارات المباشرة للعميل ولطلبات البيع/التأجير بس', () {
    final cubit = RequestsCubit(_FakeRequestsRepo(), _FakeDetailsRepo());
    expect(cubit.canMakeUnit(_request(id: 1, type: 'Sell', role: 'client')), isTrue);
    expect(
      cubit.canMakeUnit(_request(id: 2, type: 'Rent_out', role: 'client')),
      isTrue,
    );
    expect(cubit.canMakeUnit(_request(id: 3, type: 'Sell', role: 'broker')), isFalse);
    expect(
      cubit.canMakeUnit(_request(id: 4, type: 'Rent_in', role: 'client')),
      isFalse,
    );
  });

  test('تحديث الحالة بيبعث نفس بارامترات شاشة التفاصيل وبيحدث الكارت محليًا', () async {
    final repo = _FakeDetailsRepo();
    final cubit = RequestsCubit(_FakeRequestsRepo(), repo);
    final request = _request(id: 7, type: 'Sell', role: 'client');
    cubit.receivedRequests = [request];

    await cubit.updateRequestStatus(
      request: request,
      status: 'in_processing',
      actionKey: RequestListItemCard.statusActionKey(7, 'in_processing'),
    );

    expect(repo.updateCalls, 1);
    expect(repo.sentStatus, 'in_processing');
    expect(repo.sentUserId, '42');
    expect(repo.sentUnitId, '7');
    expect(cubit.receivedRequests.single.status, 'in_processing');
    expect(cubit.state, isA<UpdateRequestStatusSuccessState>());
  });
}
