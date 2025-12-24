import 'package:easy_deal/core/shared_widgets/custom_drop_down.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/data/static_form_data.dart';

class FormOfSpecializationAndDealTypeAndUnitType extends StatelessWidget {
  const FormOfSpecializationAndDealTypeAndUnitType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit, CreateRequestStates>(
      builder: (context, state) {
        var cubit = context.read<CreateRequestCubit>();
        final formData = StaticFormData.getData(context);
        final transactionTypes = formData['transaction_types'] as List<dynamic>;
        // جلب قيم transaction types للقائمة الأولى
        final specializationItems = transactionTypes
            .map<String>((item) => item['label'] as String)
            .toList();
        // // جلب deal types بناءً على الـ transaction type المحدد
        // List<String> dealTypeItems = [];
        // if (cubit.selectedSpecialization != null) {
        //   final selectedTransaction = transactionTypes.firstWhere(
        //         (item) => item['label'] == cubit.selectedSpecialization,
        //     orElse: () => null,
        //   );
        //   if (selectedTransaction != null && selectedTransaction['subtypes'] != null) {
        //     final subtypes = selectedTransaction['subtypes'] as List<dynamic>;
        //     dealTypeItems = subtypes
        //         .map<String>((subtype) => subtype['label'] as String)
        //         .toList();
        //   }
        // }
        // // جلب unit types بناءً على الـ deal type المحدد
        // List<String> unitTypeItems = [];
        // if (cubit.selectedDealType != null && cubit.selectedSpecialization != null) {
        //   final selectedTransaction = transactionTypes.firstWhere(
        //         (item) => item['label'] == cubit.selectedSpecialization,
        //     orElse: () => null,
        //   );
        //   if (selectedTransaction != null && selectedTransaction['subtypes'] != null) {
        //     final subtypes = selectedTransaction['subtypes'] as List<dynamic>;
        //     final selectedSubtype = subtypes.firstWhere(
        //           (subtype) => subtype['label'] == cubit.selectedDealType,
        //       orElse: () => null,
        //     );
        //     if (selectedSubtype != null && selectedSubtype['units'] != null) {
        //       final units = selectedSubtype['units'] as List<dynamic>;
        //       unitTypeItems = units
        //           .map<String>((unit) => unit['label'] as String)
        //           .toList();
        //     }
        //   }
        // }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LangKeys.scopeOfSpecialization.tr(), style: AppStyles.black14Regular),
            Gap(12.h),
            CustomDropdown(
              value: cubit.selectedSpecialization,
              items: specializationItems,
              onChanged: cubit.selectSpecialization,
              hint: LangKeys.scopeOfSpecialization.tr(),
              itemDisplayBuilder: (scope) => scope.toString(),
            ),

            Gap(12.h),
            Text(LangKeys.dealType.tr(), style: AppStyles.black14Regular),
            Gap(12.h),
            // CustomDropdown(
            //   value: cubit.selectedDealType,
            //   items: dealTypeItems,
            //   onChanged: cubit.selectDealType,
            //   hint: LangKeys.dealType.tr(),
            //   itemDisplayBuilder: (dealType) => dealType.toString(),
            // ),
            //
            // Gap(12.h),
            // Text(LangKeys.unitType.tr(), style: AppStyles.black14Regular),
            // Gap(12.h),
            // CustomDropdown(
            //   value: cubit.selectedUnitType,
            //   items: unitTypeItems,
            //   onChanged: cubit.selectUnitType,
            //   hint: LangKeys.unitType.tr(),
            //   itemDisplayBuilder: (unitType) => unitType.toString(),
            // ),
          ],
        );
      },
    );
  }
}

