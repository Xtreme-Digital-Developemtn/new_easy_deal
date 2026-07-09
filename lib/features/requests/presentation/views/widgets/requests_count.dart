import 'package:easy_deal/features/requests/presentation/views/widgets/requests_filter.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class RequestsCount extends StatelessWidget {
  const RequestsCount({super.key, required this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(LangKeys.requests.tr(),style: AppStyles.primary16SemiBold,),
            Gap(12.w),
            Text(
              '$count ${LangKeys.request.tr()}',
              style: AppStyles.gray14Medium,
            ),
          ],
        ),
        // IconButton(
        //   icon: const Icon(Icons.filter_list),
        //   onPressed: () async {
        //     final result = await showFilterBottomSheet(context);
        //     if (result != null && context.mounted) {
        //       // TODO: apply filter to request list
        //     }
        //   },
        // )
      ],
    );
  }
}
