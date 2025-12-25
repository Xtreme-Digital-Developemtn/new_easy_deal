import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class RangeAndID extends StatelessWidget {
  const RangeAndID({super.key, required this.range, required this.id});
  final String range;
  final String id;
  @override
  Widget build(BuildContext context) {
    return     Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.primaryDark.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(
            Icons.aspect_ratio,
            color: AppColors.primaryDark,
            size: 18,
          ),
          SizedBox(width: 8.w),
          Expanded(
            flex: 5,
            child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              range,
              style:AppStyles.primary16SemiBold,
            ),
          ),
          Spacer(),
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            '${LangKeys.requestNumber.tr()}: $id',
            style: AppStyles.gray12Medium,
          ),
        ],
      ),
    );
  }
}
