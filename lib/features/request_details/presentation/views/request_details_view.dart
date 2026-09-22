import 'package:easy_deal/core/shared_widgets/error_ui.dart';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/request_details/presentation/view_model/request_details_cubit.dart';
import 'package:easy_deal/features/request_details/presentation/view_model/request_details_states.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_actions.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_details_tab_content.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_header.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_info_grid.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/reviews_tabs.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class RequestDetailsView extends StatefulWidget {
  const RequestDetailsView({super.key,required this.requestId});
  final int requestId;

  @override
  State<RequestDetailsView> createState() => _RequestDetailsViewState();
}

class _RequestDetailsViewState extends State<RequestDetailsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<RequestDetailsCubit>();
      final id = widget.requestId ?? 0;
      // تحميل أوتوماتيك أول ما الصفحة تفتح بدون زرار - كل التابات
      if (cubit.requestDetailsModel == null) {
        cubit.requestDetails(requestId: id);
      } else {
        if (cubit.repliesList.isEmpty) {
          cubit.getReplies(requestId: id);
        }
        if (cubit.sentResponsesList.isEmpty) {
          cubit.getSentResponses(requestId: id);
        }
        if (cubit.recommendedList.isEmpty) {
          cubit.getRecommendedUnits(requestId: id);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: LangKeys.requestDetails,
        backgroundColor: AppColors.primaryDark,
        textColor: AppColors.white,
        iconColor: AppColors.white,
      ),
      body: BlocConsumer<RequestDetailsCubit, RequestDetailsStates>(
        listener: (context, state) {
          if (state is UpdateRequestStatusSuccessState) {
            Toast.showSuccessToast(
              msg: state.model.message ?? 'تم تحديث الحالة بنجاح',
              context: context,
            );
          } else if (state is UpdateRequestStatusErrorState) {
            Toast.showErrorToast(msg: state.error, context: context);
          }
        },
        buildWhen: (prev, curr) =>
            curr is GetRequestDetailsLoadingState ||
            curr is GetRequestDetailsErrorState ||
            curr is GetRequestDetailsSuccessState ||
            curr is UpdateRequestStatusSuccessState ||
            curr is RequestDetailsInitState,
        builder: (context, state) {
          var requestDetailsCubit = context.read<RequestDetailsCubit>();
          final hasModel = requestDetailsCubit.requestDetailsModel != null;
          if (state is GetRequestDetailsLoadingState ||
              (!hasModel && state is! GetRequestDetailsErrorState)) {
            return CustomLoading();
          }
          if (state is GetRequestDetailsErrorState) {
            return ErrorWidgetUi(
              onRetry: () {
                requestDetailsCubit.requestDetails(
                  requestId: widget.requestId ?? 10,
                );
              },
            );
          }
          final details = requestDetailsCubit.requestDetailsModel?.data;
          final userId =
              details?.user?.id ?? CacheHelper.getData(key: StorageKeys.userId);
          final unitId = details?.id ?? widget.requestId ?? 10;

          void updateStatus(String status) {
            requestDetailsCubit.updateRequestStatus(
              requestId: widget.requestId ?? 10,
              status: status,
              userId: userId.toString(),
              unitId: unitId.toString(),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                const RequestHeader(),
                Gap(12.h),
                RequestActions(
                    onAssignBrokerTap:(){
                      context.pushNamed(
                        Routes.assignToBrokerView,
                        arguments: {'requestId': widget.requestId},
                      );
                    },
                  onNewTap: () => updateStatus('new'),
                  onCompleteTap: () => updateStatus('finished'),
                  onStartProcessingTap: () => updateStatus('in_processing'),
                ),
                Gap(12.h),
                RequestInfoGrid(),
                Gap(12.h),
                RequestDetailsTabs(),
                Gap(12.h),
                RequestDetailsTabContent(),
                Gap(24.h),
                CustomButton(
                  onPressed: () {},
                  color: AppColors.errorDark,
                  gradientColors: false,
                  text: LangKeys.cancel.tr(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
