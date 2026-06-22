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
            return DeveloperProjectsTableData(data: data);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}