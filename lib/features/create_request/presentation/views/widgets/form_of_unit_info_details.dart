import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/shared_widgets/custom_drop_down.dart';

class FormOfUnitInfoDetails extends StatelessWidget {
  const FormOfUnitInfoDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit, CreateRequestStates>(
      builder: (context, state) {
        var createRequestCubit = context.read<CreateRequestCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 1. Unit Area
            Text(LangKeys.unitArea.tr(), style: AppStyles.black14Regular),
            Gap(6.h),
            CustomTextFormField(
              hintText: LangKeys.unitArea.tr(),
            ),
            Gap(12.h),

            /// 2 & 3. Property Number & Unit Number
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LangKeys.propertyNumber.tr(), style: AppStyles.black14Regular),
                      Gap(6.h),
                      CustomTextFormField(
                        hintText: LangKeys.propertyNumber.tr(),
                      ),
                    ],
                  ),
                ),
                Gap(12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LangKeys.unitNumber.tr(), style: AppStyles.black14Regular),
                      Gap(6.h),
                      CustomTextFormField(
                        hintText: LangKeys.unitNumber.tr(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(12.h),

            /// 4 & 5. Number of Rooms & Bathrooms
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LangKeys.numberOfRooms.tr(), style: AppStyles.black14Regular),
                      Gap(6.h),
                      CustomTextFormField(
                        hintText: LangKeys.numberOfRooms.tr(),
                      ),
                    ],
                  ),
                ),
                Gap(12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LangKeys.bathrooms.tr(), style: AppStyles.black14Regular),
                      Gap(6.h),
                      CustomTextFormField(
                        hintText: LangKeys.bathrooms.tr(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(12.h),

            /// 6. Unit Location From The Front
            Text(LangKeys.unitLocationFromTheFront.tr(), style: AppStyles.black14Regular),
            Gap(6.h),
            CustomDropdown(
              value: createRequestCubit.selectedUnitLocationFromTheFront,
              items: ["LocationFromTheFront 1", "LocationFromTheFront 2", "LocationFromTheFront 3"],
              onChanged: (val) {
                createRequestCubit.selectUnitLocationFromTheFront(val);
              },
              hint: LangKeys.unitLocationFromTheFront.tr(),
              itemDisplayBuilder: (unit) => unit.toString(),
            ),
            Gap(12.h),

            /// 7 & 8 & 9. Floor & The View
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LangKeys.floor.tr(), style: AppStyles.black14Regular),
                      Gap(6.h),
                      CustomDropdown(
                        value: createRequestCubit.selectedFloor,
                        items: ["floor 1", "floor 2", "floor 3"],
                        onChanged: (val) {
                          createRequestCubit.selectFloor(val);
                        },
                        hint: LangKeys.floor.tr(),
                        itemDisplayBuilder: (floor) => floor.toString(),
                      ),
                    ],
                  ),
                ),
                Gap(12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LangKeys.theView.tr(), style: AppStyles.black14Regular),
                      Gap(6.h),
                      CustomDropdown(
                        value: createRequestCubit.selectedTheUnitView,
                        items: ["UnitView 1", "UnitView 2", "UnitView 3"],
                        onChanged: (val) {
                          createRequestCubit.selectTheUnitView(val);
                        },
                        hint: LangKeys.theView.tr(),
                        itemDisplayBuilder: (unitView) => unitView.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(12.h),

            /// 10 & 11. Delivery Status & Finishing Condition
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LangKeys.deliveryStatus.tr(), style: AppStyles.black14Regular),
                      Gap(6.h),
                      CustomDropdown(
                        value: createRequestCubit.selectedDeliveryStatus,
                        items: ["deliveryStatus 1", "deliveryStatus 2", "deliveryStatus 3"],
                        onChanged: (val) {
                          createRequestCubit.selectDeliveryStatus(val);
                        },
                        hint: LangKeys.deliveryStatus.tr(),
                        itemDisplayBuilder: (deliveryStatus) => deliveryStatus.toString(),
                      ),
                    ],
                  ),
                ),
                Gap(12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LangKeys.finishingCondition.tr(), style: AppStyles.black14Regular),
                      Gap(6.h),
                      CustomDropdown(
                        value: createRequestCubit.selectedFinishingCondition,
                        items: ["finishingCondition 1", "finishingCondition 2", "finishingCondition 3"],
                        onChanged: (val) {
                          createRequestCubit.selectFinishingCondition(val);
                        },
                        hint: LangKeys.finishingCondition.tr(),
                        itemDisplayBuilder: (finishingCondition) => finishingCondition.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(12.h),

            /// 12. Other Luxuries
            Text(LangKeys.otherLuxuries.tr(), style: AppStyles.black14Regular),
            Gap(6.h),
            CustomDropdown(
              value: createRequestCubit.selectedOtherLuxuries,
              items: ["otherLuxuries 1", "otherLuxuries 2", "otherLuxuries 3"],
              onChanged: (val) {
                createRequestCubit.selectOtherLuxuries(val);
              },
              hint: LangKeys.otherLuxuries.tr(),
              itemDisplayBuilder: (otherLuxuries) => otherLuxuries.toString(),
            ),
            Gap(12.h),

            /// 13. Notes
            Text(LangKeys.notes.tr(), style: AppStyles.black14Regular),
            Gap(6.h),
            CustomTextFormField(
              hintText: LangKeys.notes.tr(),
              maxLines: 4,
            ),
            Gap(12.h),
          ],
        );
      },
    );
  }
}
