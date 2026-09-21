import 'package:easy_deal/core/shared_widgets/error_ui.dart';
import 'package:easy_deal/features/request_details/presentation/view_model/request_details_cubit.dart';
import 'package:easy_deal/features/request_details/presentation/view_model/request_details_states.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/additional_Information.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/basic_info_section.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/broker_info_section.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/finances_and_notes.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/order_Information.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/property_details.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_actions.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_details_tab_content.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_header.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_info_grid.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/reviews_tabs.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/site_details.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/status_information.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class RequestDetailsView extends StatefulWidget {
  const RequestDetailsView({super.key, this.requestId});
  final int? requestId;

  @override
  State<RequestDetailsView> createState() => _RequestDetailsViewState();
}

class _RequestDetailsViewState extends State<RequestDetailsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<RequestDetailsCubit>();
      final id = widget.requestId ?? 10;
      // تحميل أوتوماتيك أول ما الصفحة تفتح بدون زرار - كل التابات
      if (cubit.requestDetailsModel == null) {
        cubit.requestDetails(requestId: id);
      } else {
        if (cubit.repliesList.isEmpty) cubit.getReplies(requestId: id);
        if (cubit.sentResponsesList.isEmpty) cubit.getSentResponses(requestId: id);
        if (cubit.recommendedList.isEmpty) cubit.getRecommendedUnits(requestId: id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.requestDetails,
      backgroundColor: AppColors.primaryDark,
      textColor: AppColors.white,
        iconColor: AppColors.white,
      ),
      body: BlocBuilder<RequestDetailsCubit, RequestDetailsStates>(
        buildWhen: (prev, curr) =>
            curr is GetRequestDetailsLoadingState ||
            curr is GetRequestDetailsErrorState ||
            curr is GetRequestDetailsSuccessState ||
            curr is RequestDetailsInitState,
        builder: (context, state) {
          var requestDetailsCubit = context.read<RequestDetailsCubit>();
          final hasModel = requestDetailsCubit.requestDetailsModel != null;
          if (state is GetRequestDetailsLoadingState || (!hasModel && state is! GetRequestDetailsErrorState)) {
            return CustomLoading();
          }
          if (state is GetRequestDetailsErrorState) {
            return ErrorWidgetUi(
              onRetry: () {
                requestDetailsCubit.requestDetails(requestId: widget.requestId ?? 10);
              },
            );
          }
          return SingleChildScrollView(
                  child: Column(
                    children: [
                      const RequestHeader(),
                      Gap(12.h),
                      RequestActions(),
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
