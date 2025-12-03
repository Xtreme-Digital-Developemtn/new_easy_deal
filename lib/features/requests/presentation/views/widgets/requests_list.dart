import 'package:easy_deal/features/requests/presentation/views/widgets/request_list_item_card.dart';

import '../../../../../main_imports.dart';

class RequestsList extends StatelessWidget {
  const RequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> requests = [
      {
        'id': 'REQ001',
        'title': 'request name',
        'date': DateTime.now().subtract(Duration(days: 2)),
        'range': 'request range',
        'type': 'request type',
        'status': 'request status',
        'statusColor': AppColors.primaryDark,
        'address': 'Giza / Egypt',
      },
      {
        'id': 'REQ001',
        'title': 'request name',
        'date': DateTime.now().subtract(Duration(days: 2)),
        'range': 'request range',
        'type': 'request type',
        'status': 'request status',
        'statusColor': AppColors.primaryDark,
        'address': 'Giza / Egypt',
      },
      {
        'id': 'REQ001',
        'title': 'request name',
        'date': DateTime.now().subtract(Duration(days: 2)),
        'range': 'request range',
        'type': 'request type',
        'status': 'request status',
        'statusColor': AppColors.primaryDark,
        'address': 'Giza / Egypt',
      },
      {
        'id': 'REQ001',
        'title': 'request name',
        'date': DateTime.now().subtract(Duration(days: 2)),
        'range': 'request range',
        'type': 'request type',
        'status': 'request status',
        'statusColor': AppColors.primaryDark,
        'address': 'Giza / Egypt',
      },

    ];
    return   Expanded(
      child: ListView.separated(
        itemCount: requests.length,
        separatorBuilder: (context, index) => Gap(12.h),
        itemBuilder: (context, index) {
          final request = requests[index];
          return RequestListItemCard(
              title: request['title'],
            statusColor: request['statusColor'],
            status: request['status'],
            date: request['date'],
            type: request['type'],
            address: request['address'],
            range: request['range'],
            id: request['id'],
          );
        },
      ),
    );
  }
}
