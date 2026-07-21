import 'package:easy_deal/core/app_services/remote_services/service_locator.dart';
import 'package:easy_deal/core/utils/enums.dart';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/requests/data/models/all_request_model.dart';
import 'package:easy_deal/features/requests/data/repos/requests_repo_imple.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/address.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/date_and_type.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/name_and_status.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/range_and_id.dart';
import '../../../../../main_imports.dart';
import '../view_model/broker_data_cubit.dart';
import '../view_model/broker_data_states.dart';

class SendReplyView extends StatefulWidget {
  const SendReplyView({super.key});

  @override
  State<SendReplyView> createState() => _SendReplyViewState();
}

class _SendReplyViewState extends State<SendReplyView> {
  final Set<int> _selectedIds = {};
  bool _isSending = false;
  List<RequestItem>? _requests;
  bool _isLoading = true;
  bool _isRefreshing = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchReceivedRequests();
  }

  Future<void> _fetchReceivedRequests({bool isRefresh = false}) async {
    if (isRefresh) {
      _isRefreshing = true;
    } else {
      setState(() { _isLoading = true; _error = null; });
    }
    try {
      final repo = getIt.get<RequestsRepoImpl>();
      final result = await repo.getAllRequests(
        limit: 100,
        offset: 0,
        type: RequestType.received,
        context: context,
      );
      result.fold(
        (failure) => setState(() { _isLoading = false; _isRefreshing = false; _error = failure.errMessage; }),
        (data) => setState(() { _isLoading = false; _isRefreshing = false; _requests = data.data.data; }),
      );
    } catch (e) {
      setState(() { _isLoading = false; _isRefreshing = false; _error = e.toString(); });
    }
  }

  Future<void> _onRefresh() async {
    _selectedIds.clear();
    await _fetchReceivedRequests(isRefresh: true);
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'pending':
        return AppColors.blueLight;
      case 'accepted':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return AppColors.grayMedium;
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final unitIds = (args?['unitIds'] as List<int>?) ?? [];
    final brokerId = args?['brokerId'] as int? ?? 0;
    final senderId = args?['senderId'] as int? ?? 0;

    return Scaffold(
      appBar: GlobalAppBar(
        title: _selectedIds.isEmpty ? 'ارسال كرد' : 'ارسال كرد (${_selectedIds.length})',
      ),
      body: BlocListener<BrokerDataCubit, BrokerDataStates>(
        listener: (context, state) {
          if (state is SendReplySuccessState) {
            Toast.showSuccessToast(msg: state.model.message, context: context);
            Future.microtask(() {
              try {
                if (context.mounted) Navigator.pop(context);
              } catch (_) {}
            });
          }
          if (state is SendReplyErrorState) {
            setState(() => _isSending = false);
            Toast.showErrorToast(msg: state.error, context: context);
          }
        },
        child: _buildBody(context, brokerId, senderId, unitIds),
      ),
    );
  }

  Widget _buildBody(BuildContext context, int brokerId, int senderId, List<int> unitIds) {
    if (_isLoading) {
      return const Center(child: CustomLoading());
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(32.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 48.sp, color: AppColors.grayMedium),
              Gap(16.h),
              Text(_error!, style: AppStyles.gray14Medium, textAlign: TextAlign.center),
              Gap(24.h),
              CustomButton(
                onPressed: () => _fetchReceivedRequests(),
                text: 'إعادة المحاولة',
                width: 200.w,
              ),
            ],
          ),
        ),
      );
    }

    final requests = _requests ?? [];

    return Column(
      children: [
        if (requests.isNotEmpty)
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(16.r, 8.r, 16.r, 0),
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.primaryDark.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: AppColors.primaryDark, size: 18.r),
                Gap(8.w),
                Expanded(
                  child: Text(
                    _selectedIds.isEmpty
                        ? 'اختر الطلبات التي تريد إرسال الرد إليها'
                        : 'تم اختيار ${_selectedIds.length} طلب${_selectedIds.length > 1 ? 'ات' : ''}',
                    style: TextStyle(color: AppColors.primaryDark, fontSize: 13.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: requests.isEmpty
                ? ListView(
                    children: [
                      SizedBox(height: 200.h),
                      Center(
                        child: Text('لا توجد طلبات', style: AppStyles.gray14Medium),
                      ),
                    ],
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(16.r),
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: requests.length,
                    itemBuilder: (context, index) {
                    final request = requests[index];
                    final isSelected = _selectedIds.contains(request.id);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedIds.remove(request.id);
                          } else {
                            _selectedIds.add(request.id);
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: isSelected ? AppColors.primaryDark : const Color.fromRGBO(213, 224, 252, 1),
                            width: isSelected ? 2.w : 1.w,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10.r,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(isSelected ? 15.r : 16.r),
                          child: Row(
                            children: [
                              if (isSelected)
                                Container(width: 4.w, color: AppColors.primaryDark),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(16.r),
                                  color: isSelected ? AppColors.primaryDark.withValues(alpha: 0.03) : Colors.white,
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          NameAndStatus(
                                            title: request.title?.toString() ?? '',
                                            statusColor: _statusColor(request.status?.toString() ?? ''),
                                            status: request.status?.toString() ?? '',
                                          ),
                                          Gap(12.h),
                                          DateAndType(
                                            date: DateTime.now().subtract(const Duration(days: 2)),
                                            type: request.type?.toString() ?? '',
                                          ),
                                          Gap(12.h),
                                          Address(address: request.detailedAddress ?? ''),
                                          Gap(12.h),
                                          RangeAndID(
                                            range: request.specializationScope?.toString() ?? '',
                                            id: request.id.toString(),
                                          ),
                                        ],
                                      ),
                                      if (isSelected)
                                        Positioned(
                                          top: 0, right: 0,
                                          child: Container(
                                            padding: EdgeInsets.all(4.r),
                                            decoration: const BoxDecoration(color: AppColors.primaryDark, shape: BoxShape.circle),
                                            child: Icon(Icons.check, color: Colors.white, size: 16.r),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
        ),
        if (_selectedIds.isNotEmpty && !_isSending)
          Padding(
            padding: EdgeInsets.all(16.r),
            child: SizedBox(
              width: double.infinity,
              child: CustomButton(
                onPressed: () {
                  setState(() => _isSending = true);
                  for (final requestId in _selectedIds) {
                    context.read<BrokerDataCubit>().sendReply(
                      brokerId: brokerId,
                      requestId: requestId,
                      senderId: senderId,
                      unitIds: unitIds,
                    );
                  }
                },
                text: 'إرسال الرد (${_selectedIds.length})',
              ),
            ),
          ),
        if (_isSending)
          Padding(
            padding: EdgeInsets.all(16.r),
            child: SizedBox(
              width: double.infinity,
              height: 50.h,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: AppColors.primaryDark,
                  size: 30.r,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
