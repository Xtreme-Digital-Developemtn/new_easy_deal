import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_imports.dart';
import '../../view_model/search_cubit.dart';

class TypeDeliveryStatus extends StatelessWidget {
  const TypeDeliveryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SearchCubit>();
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LangKeys.type.tr()),
              Gap(4.h),
              CustomDropdown(
                value: cubit.type,
                items: cubit.types.values.toList(),
                hint: LangKeys.type.tr(),
                itemDisplayBuilder: (item) {
                  final key = cubit.types.entries.firstWhere((entry) => entry.value == item).key;
                  return key;
                },
                onChanged: (val) {
                  cubit.selectType(val);
                },
              ),
            ],
          ),
        ),
        Gap(8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LangKeys.deliveryStatus.tr()),
              Gap(4.h),
              CustomDropdown(
                value: cubit.deliveryStatus,
                items: cubit.status.values.toList(),
                hint: LangKeys.deliveryStatus.tr(),
                itemDisplayBuilder: (item) {
                  final key = cubit.status.entries.firstWhere((entry) => entry.value == item).key;
                  return key;
                },
                onChanged: (val) {
                  cubit.selectDeliveryStatus(val);
                },
              ),

            ],
          ),
        ),
      ],
    );
  }
}
