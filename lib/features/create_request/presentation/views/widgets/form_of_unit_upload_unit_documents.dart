import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dynamic_form_field.dart';

class FormOfUnitUploadUnitDocuments extends StatelessWidget {
  const FormOfUnitUploadUnitDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit, CreateRequestStates>(
      builder: (context, state) {
        var cubit = context.read<CreateRequestCubit>();
        final inputs = cubit.currentStepInputs;

        if (inputs.isEmpty) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.gray),
            ),
            child: Column(
              children: [
                Icon(Icons.info_outline, size: 32, color: AppColors.gray),
                Gap(8.h),
                Text(
                  LangKeys.step4InfoMessage.tr(),
                  textAlign: TextAlign.center,
                  style: AppStyles.gray14Medium,
                ),
              ],
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: inputs.map((config) => DynamicFormField(config: config)).toList(),
        );
      },
    );
  }
}
