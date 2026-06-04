import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/dynamic_form_field.dart';
import 'package:easy_localization/easy_localization.dart';

class FormOfCityAreaSubAreaAddressLocationLink extends StatefulWidget {
  const FormOfCityAreaSubAreaAddressLocationLink({super.key});

  @override
  State<FormOfCityAreaSubAreaAddressLocationLink> createState() =>
      _FormOfCityAreaSubAreaAddressLocationLinkState();
}

class _FormOfCityAreaSubAreaAddressLocationLinkState
    extends State<FormOfCityAreaSubAreaAddressLocationLink> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CreateRequestCubit>().getCities();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit, CreateRequestStates>(
      builder: (context, state) {
        var cubit = context.read<CreateRequestCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// City
            Text(LangKeys.city.tr(), style: AppStyles.black14Regular),
            Gap(12.h),
            CustomDropdown<String>(
              value: cubit.selectedCityObj != null
                  ? (context.isArabic
                      ? cubit.selectedCityObj!.nameAr
                      : cubit.selectedCityObj!.nameEn)
                  : null,
              items: cubit.citiesList
                  .map((c) => context.isArabic ? c.nameAr ?? '' : c.nameEn ?? '')
                  .toList(),
              hint: state is GetCitiesLoadingState
                  ? 'Loading...'
                  : LangKeys.city.tr(),
              itemDisplayBuilder: (name) => name,
              onChanged: (selectedName) {
                if (selectedName != null) {
                  final city = cubit.citiesList.firstWhere(
                    (c) =>
                        (context.isArabic ? c.nameAr : c.nameEn) ==
                        selectedName,
                  );
                  cubit.selectCity(city);
                  cubit.getAreas(cityId: city.id!);
                }
              },
            ),
            Gap(12.h),

            /// Area
            Text(LangKeys.area.tr(), style: AppStyles.black14Regular),
            Gap(12.h),
            CustomDropdown<String>(
              value: cubit.selectedAreaObj != null
                  ? (context.isArabic
                      ? cubit.selectedAreaObj!.nameAr
                      : cubit.selectedAreaObj!.nameEn)
                  : null,
              items: cubit.areasList
                  .map((a) => context.isArabic ? a.nameAr ?? '' : a.nameEn ?? '')
                  .toList(),
              hint: state is GetAreasLoadingState
                  ? 'Loading...'
                  : LangKeys.area.tr(),
              itemDisplayBuilder: (name) => name,
              onChanged: (selectedName) {
                if (selectedName != null) {
                  final area = cubit.areasList.firstWhere(
                    (a) =>
                        (context.isArabic ? a.nameAr : a.nameEn) ==
                        selectedName,
                  );
                  cubit.selectArea(area);
                  cubit.getSubAreas(areaId: area.id!);
                }
              },
            ),
            Gap(12.h),

            /// Sub Area
            if (cubit.selectedAreaObj != null) ...[
              Text(LangKeys.subArea.tr(), style: AppStyles.black14Regular),
              Gap(12.h),
              CustomDropdown<String>(
                value: cubit.isSubAreaOther
                    ? LangKeys.other.tr()
                    : null,
                items: [LangKeys.other.tr()],
                hint: '',
                itemDisplayBuilder: (name) => name,
                onChanged: (selectedName) {
                  if (selectedName != null) {
                    cubit.selectSubAreaOther();
                  }
                },
              ),
              if (cubit.isSubAreaOther) ...[
                Gap(12.h),
                Text(LangKeys.otherSubArea.tr(), style: AppStyles.black14Regular),
                Gap(6.h),
                CustomTextFormField(
                  controller: cubit.otherSubAreaCon,
                  hintText: LangKeys.otherSubArea.tr(),
                ),
              ],
            ],
            Gap(12.h),
            ...cubit.currentStepInputs
                .where((input) => !['cityId', 'areaId', 'subAreaId'].contains(input.name))
                .map((input) => Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: DynamicFormField(config: input),
                    )),
          ],
        );
      },
    );
  }
}
