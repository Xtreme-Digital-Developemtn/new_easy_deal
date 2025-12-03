import 'package:easy_deal/features/requests/presentation/views/widgets/date_and_type.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/range_and_id.dart';

import '../../../../../main_imports.dart';
import 'address.dart';
import 'name_and_status.dart';

class RequestListItemCard extends StatelessWidget {
  const RequestListItemCard({super.key, required this.title, required this.statusColor, required this.status, required this.date, required this.type, required this.address, required this.range, required this.id});
  final String title;
  final Color statusColor;
  final String status;
  final String type;
  final String address;
  final String range;
  final String id;
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10.r,
              offset: Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: AppColors.grayLight,
            width: 1.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NameAndStatus(title: title, statusColor: statusColor, status: status),
            Gap(12.h),
            DateAndType(date: date,type: type,),
            Gap(12.h),
            Address(address: address,),
            Gap(12.h),
            RangeAndID(range: range, id: id),
          ],
        ),
      ),
    );
  }
}
