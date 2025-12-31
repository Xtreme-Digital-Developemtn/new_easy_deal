import 'package:easy_deal/features/search/presentation/view_model/search_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_imports.dart';

class PropertyTypeAndProcess extends StatelessWidget {
  const PropertyTypeAndProcess({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SearchCubit>();
    return   Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LangKeys.propertyType.tr()),
              Gap(4.h),
              CustomDropdown(
                value: cubit.properType,
                items: cubit.properTypes.values.toList(),
                hint: LangKeys.propertyType.tr(),
                itemDisplayBuilder: (item) {
                  final key = cubit.properTypes.entries.firstWhere((entry) => entry.value == item).key;
                  return key;
                },
                onChanged: (val) {
                  cubit.selectProperType(val);
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
              Text(LangKeys.theProcess.tr()) ,
              Gap(4.h),
              CustomDropdown(
                value: cubit.theProcess,
                items: cubit.process.values.toList(),
                hint: LangKeys.theProcess.tr(),
                itemDisplayBuilder: (item) {
                  final key = cubit.process.entries.firstWhere((entry) => entry.value == item).key;
                  return key;
                },
                onChanged: (val) {
                  cubit.selectTheProcess(val);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
