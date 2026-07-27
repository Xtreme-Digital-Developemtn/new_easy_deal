import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/developer_models_view.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/widgets/developer_projects_table_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/main_imports.dart';
import '../view_model/broker_developers_cubit.dart';
import '../view_model/broker_developers_states.dart';

class DeveloperProjectsView extends StatefulWidget {
  final int developerId;
  final BrokerDevelopersCubit cubit;
  const DeveloperProjectsView({super.key, required this.developerId, required this.cubit});

  @override
  State<DeveloperProjectsView> createState() => _DeveloperProjectsViewState();
}

class _DeveloperProjectsViewState extends State<DeveloperProjectsView> {
  @override
  void initState() {
    super.initState();
    widget.cubit.getDeveloperProjects(widget.developerId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.projects),
      body: BlocBuilder<BrokerDevelopersCubit, BrokerDevelopersStates>(
        builder: (context, state) {
          if (state is GetDeveloperProjectsLoadingState) {
            return const CustomLoading();
          } else if (state is GetDeveloperProjectsErrorState) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.error),
                  Gap(16.h),
                  CustomButton(
                    text: LangKeys.reload,
                    onPressed: () {
                      widget.cubit.getDeveloperProjects(widget.developerId);
                    },
                  ),
                ],
              ),
            );
          } else if (state is GetDeveloperProjectsSuccessState) {
            var data = state.projectsModel?.data ?? [];
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
                        child: Icon(Icons.folder_open_rounded, color: Colors.white, size: 24.r),
                      ),
                      Gap(14.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LangKeys.projects.tr(),
                              style: AppStyles.black14Medium.copyWith(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(4.h),
                            Text(
                              '${data.length} ${LangKeys.projects.tr()}',
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
                  child: DeveloperProjectsTableData(
                    data: data,
                    onModelsTap: (projectId) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DeveloperModelsView(projectId: projectId),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}