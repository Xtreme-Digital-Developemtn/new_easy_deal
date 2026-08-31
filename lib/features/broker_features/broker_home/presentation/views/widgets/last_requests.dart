import 'package:easy_deal/features/broker_features/broker_home/presentation/view_model/broker_home_cubit.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/view_model/broker_home_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../broker_features/broker_home/data/models/last_requests_model_in_home.dart';

import '../../../../../requests/presentation/views/widgets/request_list_item_card.dart';

class LastRequests extends StatefulWidget {
  const LastRequests({super.key, required this.brokerId});
  final int brokerId;

  @override
  State<LastRequests> createState() => _LastRequestsState();
}

class _LastRequestsState extends State<LastRequests> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<BrokerHomeCubit>().getLastRequestsModelInHome(brokerId: widget.brokerId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrokerHomeCubit, BrokerHomeStates>(
      builder: (context, state) {
        final lastRequests = context.watch<BrokerHomeCubit>().lastRequestsModelInHome;

        if (state is GetLastRequestsModelInHomeLoadingState) {
          return const Center(child: CustomLoading());
        } else if (state is GetLastRequestsModelInHomeErrorState) {
          return Text(LangKeys.somethingWentWrong.tr(),
              style: AppStyles.black14Medium);
        } else if (state is GetLastRequestsModelInHomeSuccessState) {
          final requests = lastRequests?.data?.whereType<Data>().toList() ?? [];
          if (requests.isEmpty) {
            return Text('لا توجد طلبات',
                style: AppStyles.black14Medium);
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LangKeys.recentRequests.tr(),
                    style: AppStyles.black16SemiBold),
                Gap(12.h),
                ...requests.map((request) => requestListItemCard(request)).toList(),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget requestListItemCard(Data data) {
    final statusColor = _getStatusColor(data.status);
    final type = data.type ?? '';
    final title = data.title ?? '';
    final address = _buildAddress(data);
    final range = '${data.unit ?? ''} ${LangKeys.propertyType.tr()}';
    final date = data.createdAt != null
        ? _formatDate(data.createdAt!)
        : '';
    final id = data.id.toString();

    return RequestListItemCard(
      title: title,
      statusColor: statusColor,
      status: data.status ?? '',
      date: DateTime.parse(date),
      type: type,
      address: address,
      range: range,
      id: id,
    );
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case 'finished':
        return AppColors.successDark;
      case 'in_process':
        return AppColors.orangeOriginal;
      case 'pending':
        return AppColors.errorDark;
      default:
        return AppColors.primaryDark;
    }
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return '${date.day}/${date.month}/${date.year}';
    } catch (_) {
      return dateStr;
    }
  }

  String _buildAddress(Data data) {
    final parts = <String>[];
    if (data.attributes?.compoundName != null) {
      parts.add(data.attributes!.compoundName!);
    }
    if (data.attributes?.unitNumber != null) {
      parts.add('رقم ${data.attributes!.unitNumber!}');
    }
    if (data.attributes?.floor != null) {
      parts.add('طابق ${data.attributes!.floor!}');
    }
    return parts.isNotEmpty ? parts.join(' · ') : '';
  }
}