import 'package:easy_deal/features/requests/presentation/view_model/requests_cubit.dart';
import 'package:easy_deal/features/requests/presentation/view_model/requests_states.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/requests_count.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/requests_list.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: BlocBuilder<RequestsCubit, RequestsStates>(
            builder: (context, state) {
              var requestsCubit = context.read<RequestsCubit>();
              final isLoading = state is GetAllRequestsLoadingState || requestsCubit.allRequestModel == null;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeletonizer(
                    enabled: isLoading,
                    child: RequestsCount(
                      count: requestsCubit.allRequestModel?.data?.count ?? 0,
                    ),
                  ),
                  Gap(24.h),
                  RequestsList(
                    data: requestsCubit.allRequestModel?.data?.data ?? [],
                    isLoading: isLoading,
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(Routes.createRequestView);
        },
        backgroundColor: AppColors.primaryDark,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}