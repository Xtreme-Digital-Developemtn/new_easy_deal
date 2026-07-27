import 'package:easy_deal/core/app_services/remote_services/service_locator.dart';
import 'package:easy_deal/features/broker_features/broker_developers/data/repos/broker_developers_repo_imple.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/widgets/developer_models_table_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/main_imports.dart';
import '../view_model/broker_developers_cubit.dart';
import '../view_model/broker_developers_states.dart';

class DeveloperModelsView extends StatefulWidget {
  final int projectId;
  const DeveloperModelsView({super.key, required this.projectId});

  @override
  State<DeveloperModelsView> createState() => _DeveloperModelsViewState();
}

class _DeveloperModelsViewState extends State<DeveloperModelsView> {
  late final BrokerDevelopersCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BrokerDevelopersCubit(getIt.get<BrokerDevelopersRepoImpl>());
    _cubit.getProjectModels(widget.projectId);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: GlobalAppBar(title: LangKeys.models),
        body: BlocBuilder<BrokerDevelopersCubit, BrokerDevelopersStates>(
          builder: (context, state) {
            if (state is GetProjectModelsLoadingState) {
              return const CustomLoading();
            } else if (state is GetProjectModelsErrorState) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.error),
                    Gap(16.h),
                    CustomButton(
                      text: LangKeys.reload,
                      onPressed: () {
                        _cubit.getProjectModels(widget.projectId);
                      },
                    ),
                  ],
                ),
              );
            } else if (state is GetProjectModelsSuccessState) {
              var data = state.modelsResponse?.data ?? [];
              if (data.isEmpty) {
                return Center(
                  child: Text(LangKeys.thereAreNoItemsCurrentlyAvailable.tr()),
                );
              }
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(16.r, 16.r, 16.r, 0),
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryDark,
                          AppColors.primaryDark.withValues(alpha: 0.85),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryDark.withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(Icons.dashboard_rounded, color: Colors.white, size: 24.r),
                        ),
                        Gap(14.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LangKeys.models.tr(),
                                style: AppStyles.black14Medium.copyWith(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Gap(4.h),
                              Text(
                                '${data.length} ${LangKeys.models.tr()}',
                                style: AppStyles.black14Medium.copyWith(
                                  color: Colors.white.withValues(alpha: 0.8),
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: DeveloperModelsTableData(data: data),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}