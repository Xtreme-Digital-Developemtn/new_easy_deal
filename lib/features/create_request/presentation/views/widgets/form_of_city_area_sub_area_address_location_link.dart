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
            Text.rich(
              TextSpan(
                text: LangKeys.city.tr(),
                style: AppStyles.black14SemiBold,
                children: [
                  TextSpan(
                    text: ' *',
                    style: AppStyles.black14SemiBold.copyWith(color: Colors.red),
                  ),
                ],
              ),
            ),
            Gap(8.h),
            Container(
              width: double.infinity,
              height: 52.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  color: cubit.selectedCityObj != null ? AppColors.primaryDark.withValues(alpha: 0.35) : AppColors.blueLight,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: DropdownButton<String>(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                isExpanded: true,
                underline: const SizedBox.shrink(),
                value: cubit.selectedCityObj != null
                    ? (context.isArabic
                        ? cubit.selectedCityObj!.nameAr
                        : cubit.selectedCityObj!.nameEn)
                    : null,
                hint: Text(
                  state is GetCitiesLoadingState ? 'Loading...' : LangKeys.city.tr(),
                  style: TextStyle(
                    color: const Color(0xFF969696),
                    fontSize: 14.sp,
                  ),
                ),
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.primaryDark,
                  size: 24.sp,
                ),
                items: cubit.citiesList
                    .map((c) => context.isArabic ? c.nameAr ?? '' : c.nameEn ?? '')
                    .map((name) => DropdownMenuItem<String>(
                          value: name,
                          child: Text(name),
                        ))
                    .toList(),
                onChanged: cubit.citiesList.isEmpty ? null : (selectedName) {
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
            ),
            if (cubit.validationAttempted && cubit.formErrors['cityId'] != null)
              Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Text(
                  cubit.formErrors['cityId']!,
                  style: TextStyle(color: Colors.red, fontSize: 12.sp),
                ),
              ),
            Gap(12.h),

            /// Area
            Text.rich(
              TextSpan(
                text: LangKeys.area.tr(),
                style: AppStyles.black14SemiBold,
                children: [
                  TextSpan(
                    text: ' *',
                    style: AppStyles.black14SemiBold.copyWith(color: Colors.red),
                  ),
                ],
              ),
            ),
            Gap(8.h),
            Container(
              width: double.infinity,
              height: 52.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  color: cubit.selectedAreaObj != null ? AppColors.primaryDark.withValues(alpha: 0.35) : AppColors.blueLight,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: DropdownButton<String>(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                isExpanded: true,
                underline: const SizedBox.shrink(),
                value: cubit.selectedAreaObj != null
                    ? (context.isArabic
                        ? cubit.selectedAreaObj!.nameAr
                        : cubit.selectedAreaObj!.nameEn)
                    : null,
                hint: Text(
                  state is GetAreasLoadingState ? 'Loading...' : LangKeys.area.tr(),
                  style: TextStyle(
                    color: const Color(0xFF969696),
                    fontSize: 14.sp,
                  ),
                ),
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: cubit.areasList.isNotEmpty ? AppColors.primaryDark : AppColors.grayLight,
                  size: 24.sp,
                ),
                items: cubit.areasList
                    .map((a) => context.isArabic ? a.nameAr ?? '' : a.nameEn ?? '')
                    .map((name) => DropdownMenuItem<String>(
                          value: name,
                          child: Text(name),
                        ))
                    .toList(),
                onChanged: cubit.areasList.isEmpty ? null : (selectedName) {
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
            ),
            if (cubit.validationAttempted && cubit.formErrors['areaId'] != null)
              Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Text(
                  cubit.formErrors['areaId']!,
                  style: TextStyle(color: Colors.red, fontSize: 12.sp),
                ),
              ),
            Gap(12.h),

            /// Sub Area
            if (cubit.selectedAreaObj != null) ...[
              Text(LangKeys.subArea.tr(), style: AppStyles.black14SemiBold),
              Gap(8.h),
              Container(
                width: double.infinity,
                height: 52.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    color: cubit.isSubAreaOther ? AppColors.primaryDark.withValues(alpha: 0.35) : AppColors.blueLight,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: DropdownButton<String>(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  isExpanded: true,
                  underline: const SizedBox.shrink(),
                  value: cubit.isSubAreaOther ? LangKeys.other.tr() : null,
                  hint: Text(
                    LangKeys.subArea.tr(),
                    style: TextStyle(
                      color: const Color(0xFF969696),
                      fontSize: 14.sp,
                    ),
                  ),
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.primaryDark,
                    size: 24.sp,
                  ),
                  items: [
                    DropdownMenuItem<String>(
                      value: LangKeys.other.tr(),
                      child: Text(LangKeys.other.tr()),
                    )
                  ],
                  onChanged: (selectedName) {
                    if (selectedName != null) {
                      cubit.selectSubAreaOther();
                    }
                  },
                ),
              ),
              if (cubit.isSubAreaOther) ...[
                Gap(12.h),
                Text(LangKeys.otherSubArea.tr(), style: AppStyles.black14SemiBold),
                Gap(8.h),
                CustomTextFormField(
                  controller: cubit.otherSubAreaCon,
                  hintText: LangKeys.otherSubArea.tr(),
                  height: 52.h,
                  borderRadius: 10.r,
                  borderWidth: 1.5,
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
