import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_cubit.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_states.dart';
import 'package:easy_deal/features/search/presentation/views/widgets/property_type_and_process.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/shared_widgets/general_bottom_sheet.dart';
import 'filter_text_and_reset_data.dart';

class FilterContainer extends StatelessWidget {
  const FilterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit , SearchStates>(
      // buildWhen: (previous, current){
      //   return current is GetAllUnitsSuccessState || current is GetAllUnitsErrorState || current is ResetFiltersState;
      // },
      listener: (context,state){
        if(state is GetAllUnitsFilterSuccessState){
          Navigator.of(context).pop();
          context.read<SearchCubit>().resetFilters();
          Toast.showSuccessToast(msg: state.allUnitsModel.message.toString(), context: context);
        }
        else if (state is GetAllUnitsErrorState){
          Toast.showErrorToast(msg: state.error, context: context);
        }
      },
      builder: (context,state){
        return InkWell(
            onTap: () {
              final searchCubit = context.read<SearchCubit>();
              StandardBottomSheet.show(
                context: context,
                isScrollControlled: true,
                child: BlocProvider.value(
                  value: searchCubit,
                  child: Builder(
                    builder: (sheetContext) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: 20.r,
                          left: 20.r,
                          right: 20.r,
                          bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
                        ),
                        child: BlocBuilder<SearchCubit, SearchStates>(
                          builder: (context, state) {
                            final cubit = context.watch<SearchCubit>();
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  /// Filter Text & ResetData
                                  FilterTextAndResetData(),
                                  Gap(24.h),
                                  /// property Type & Process
                                  PropertyTypeAndProcess(),
                                  // Gap(12.h),
                                  // Row(
                                  //   children: [
                                  //     Expanded(
                                  //       child: Column(
                                  //         crossAxisAlignment: CrossAxisAlignment.start,
                                  //         children: [
                                  //           Text(LangKeys.type.tr()),
                                  //           Gap(4.h),
                                  //           CustomDropdown(
                                  //             value: cubit.type,
                                  //             items: cubit.types.keys.toList(),
                                  //             hint: LangKeys.type.tr(),
                                  //             itemDisplayBuilder: (item) => item.toString(),
                                  //             onChanged: (val) {
                                  //               cubit.selectType(val);
                                  //             },
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //     Gap(8.w),
                                  //     Expanded(
                                  //       child: Column(
                                  //         crossAxisAlignment: CrossAxisAlignment.start,
                                  //         children: [
                                  //           Text(LangKeys.deliveryStatus.tr()),
                                  //           Gap(4.h),
                                  //           CustomDropdown(
                                  //             value: cubit.deliveryStatus,
                                  //             items: cubit.status.keys.toList(),
                                  //             hint: LangKeys.deliveryStatus.tr(),
                                  //             itemDisplayBuilder: (item) => item.toString(),
                                  //             onChanged: (val) {
                                  //               cubit.selectDeliveryStatus(val);
                                  //             },
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // Gap(12.h),
                                  // Row(
                                  //   children: [
                                  //     Expanded(
                                  //       child: Column(
                                  //         crossAxisAlignment: CrossAxisAlignment.start,
                                  //         children: [
                                  //           Text(LangKeys.priceFrom.tr()),
                                  //           Gap(4.h),
                                  //           CustomTextFormField(
                                  //             controller: cubit.priceFromCon,
                                  //             hintText: LangKeys.priceFrom.tr(),
                                  //             keyboardType: TextInputType.number,
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //     Gap(8.w),
                                  //     Expanded(
                                  //       child: Column(
                                  //         crossAxisAlignment: CrossAxisAlignment.start,
                                  //         children: [
                                  //           Text(LangKeys.priceTo.tr()),
                                  //           Gap(4.h),
                                  //           CustomTextFormField(
                                  //             controller: cubit.priceToCon,
                                  //             hintText: LangKeys.priceTo.tr(),
                                  //             keyboardType: TextInputType.number,
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // Gap(12.h),
                                  // Row(
                                  //   children: [
                                  //     Expanded(
                                  //       child: Column(
                                  //         crossAxisAlignment: CrossAxisAlignment.start,
                                  //         children: [
                                  //           Text(LangKeys.areaFrom.tr()),
                                  //           Gap(4.h),
                                  //           CustomTextFormField(
                                  //             controller: cubit.areaFromCon,
                                  //             hintText: LangKeys.areaFrom.tr(),
                                  //             keyboardType: TextInputType.number,
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //     Gap(8.w),
                                  //     Expanded(
                                  //       child: Column(
                                  //         crossAxisAlignment: CrossAxisAlignment.start,
                                  //         children: [
                                  //           Text(LangKeys.areaTo.tr()),
                                  //           Gap(4.h),
                                  //           CustomTextFormField(
                                  //             controller: cubit.areaToCon,
                                  //             hintText: LangKeys.areaTo.tr(),
                                  //             keyboardType: TextInputType.number,
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  Gap(24.h),
                                  ConditionalBuilder(
                                    condition: state is ! GetAllUnitsLoadingState,
                                    fallback: (context)=>CustomLoading(),
                                    builder: (context){
                                      return CustomButton(
                                        text: LangKeys.filter.tr(),
                                        onPressed: (){
                                          print(cubit.properType);
                                          print(cubit.theProcess);
                                          // print(cubit.type);
                                          // print(cubit.deliveryStatus);
                                          // print(cubit.priceFromCon);
                                          // print(cubit.priceToCon);
                                          // print(cubit.areaFromCon);
                                          // print(cubit.areaToCon);
                                          cubit.getAllUnits(isFilter: true);
                                        },
                                      );
                                    },

                                  ),
                                  Gap(24.h),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  ),
                ),
              );
            },
            child: Container(
            padding: EdgeInsets.all(12.r),
            height: 50.h,
            width:  50.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                    color: AppColors.blueLight
                )
            ),
            child: SvgPicture.asset(SvgImages.filter,colorFilter: ColorFilter.mode(AppColors.primaryDark,
              BlendMode.srcIn,
            ),
            ),
          ),
        );
      },

    );
  }
}
