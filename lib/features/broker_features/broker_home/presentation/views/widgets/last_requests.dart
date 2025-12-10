import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../requests/presentation/views/widgets/request_list_item_card.dart';

class LastRequests extends StatelessWidget {
  const LastRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LangKeys.recentRequests.tr(),style: AppStyles.black16SemiBold,),
        Gap(12.h),
        ListView.separated(
          shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return RequestListItemCard(
                title: "title",
                statusColor: AppColors.primaryDark,
                status:  'status',
                date:  DateTime.now().subtract(Duration(days: 2)),
                type:  'type',
                address:  'address',
                range:  'range',
                id:  'id',
              );
            },
            separatorBuilder: (context,index){
              return Gap(12.h);
            },
            itemCount: 1,
        )
      ],
    );
  }
}
