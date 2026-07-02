 import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/developer_projects_view.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/widgets/developers_table_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/main_imports.dart';
import '../view_model/broker_developers_cubit.dart';
import '../view_model/broker_developers_states.dart';

class BrokerDevelopersView extends StatefulWidget {
  const BrokerDevelopersView({super.key});
  @override
  State<BrokerDevelopersView> createState() => _BrokerDevelopersViewState();
}

class _BrokerDevelopersViewState extends State<BrokerDevelopersView> {
  @override
  void initState() {
    super.initState();
    context.read<BrokerDevelopersCubit>().getDevelopers();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BrokerDevelopersCubit>();
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.developers),
      body: BlocBuilder<BrokerDevelopersCubit, BrokerDevelopersStates>(
        builder: (context, state) {
          if (state is GetDevelopersLoadingState && cubit.developersModel == null) {
            return const CustomLoading();
          }
          if (state is GetDevelopersErrorState && cubit.developersModel == null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.error),
                  Gap(16.h),
                  CustomButton(
                    text: LangKeys.reload,
                    onPressed: () {
                      cubit.getDevelopers();
                    },
                  ),
                ],
              ),
            );
          }
          var data = cubit.developersModel?.data ?? [];
          if (data.isEmpty) {
            return Center(
              child: Text(LangKeys.thereAreNoItemsCurrentlyAvailable.tr()),
            );
          }
          return DevelopersTableData(
            data: data,
            onProceduresTap: (developerId) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DeveloperProjectsView(
                    developerId: developerId,
                    cubit: cubit,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}