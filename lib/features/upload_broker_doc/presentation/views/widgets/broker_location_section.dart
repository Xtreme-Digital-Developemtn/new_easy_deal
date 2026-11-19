import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_cubit.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

/// اختيار المدينة / المنطقة / المنطقة الفرعية أثناء إنشاء الحساب.
class BrokerLocationSection extends StatelessWidget {
  const BrokerLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadBrokerDocCubit, UploadBrokerDocStates>(
      builder: (context, state) {
        final cubit = context.read<UploadBrokerDocCubit>();
        final isArabic = context.isArabic;

        String nameOf(String? ar, String? en) =>
            (isArabic ? (ar ?? en) : (en ?? ar)) ?? '';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LangKeys.workAreas.tr(),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryDark,
              ),
            ),
            Gap(12.h),

            _label('${LangKeys.city.tr()} *'),
            Gap(8.h),
            if (state is GetCitiesLoadingState)
              const CustomLoading()
            else
              CustomDropdown<int>(
                hint: LangKeys.selectCity.tr(),
                value: cubit.selectedCity?.id,
                items: cubit.citiesList
                    .where((c) => c.id != null)
                    .map((c) => c.id!)
                    .toList(),
                itemDisplayBuilder: (id) {
                  final city = cubit.citiesList.firstWhere((c) => c.id == id);
                  return nameOf(city.nameAr, city.nameEn);
                },
                onChanged: (id) {
                  if (id == null) return;
                  cubit.selectCity(
                    cubit.citiesList.firstWhere((c) => c.id == id),
                  );
                },
              ),
            Gap(16.h),

            _label('${LangKeys.area.tr()} *'),
            Gap(8.h),
            if (state is GetAreasLoadingState)
              const CustomLoading()
            else
              CustomDropdown<int>(
                hint: cubit.selectedCity == null
                    ? LangKeys.selectCityFirst.tr()
                    : LangKeys.selectArea.tr(),
                value: cubit.selectedArea?.id,
                items: cubit.areasList
                    .where((a) => a.id != null)
                    .map((a) => a.id!)
                    .toList(),
                itemDisplayBuilder: (id) {
                  final area = cubit.areasList.firstWhere((a) => a.id == id);
                  return nameOf(area.nameAr, area.nameEn);
                },
                onChanged: (id) {
                  if (id == null) return;
                  cubit.selectArea(
                    cubit.areasList.firstWhere((a) => a.id == id),
                  );
                },
              ),
            Gap(16.h),

            _label(LangKeys.subArea.tr()),
            Gap(8.h),
            if (state is GetSubAreasLoadingState)
              const CustomLoading()
            else
              CustomDropdown<int>(
                hint: cubit.selectedArea == null
                    ? LangKeys.selectAreaFirst.tr()
                    : LangKeys.selectSubArea.tr(),
                value: cubit.selectedSubArea?.id,
                items: cubit.subAreasList
                    .where((s) => s.id != null)
                    .map((s) => s.id!)
                    .toList(),
                itemDisplayBuilder: (id) {
                  final sub = cubit.subAreasList.firstWhere((s) => s.id == id);
                  return nameOf(sub.nameAr, sub.nameEn);
                },
                onChanged: (id) {
                  if (id == null) return;
                  cubit.selectSubArea(
                    cubit.subAreasList.firstWhere((s) => s.id == id),
                  );
                },
              ),
          ],
        );
      },
    );
  }

  Widget _label(String text) => Text(text, style: AppStyles.black14SemiBold);
}
