import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/shared_widgets/custom_drop_down.dart';

class PaymentSystemAndPrice extends StatelessWidget {
  const PaymentSystemAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit , CreateRequestStates>(
      builder: (context,state){
        var createRequestCubit = context.read<CreateRequestCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LangKeys.paymentSystem.tr(),style: AppStyles.black14Regular,),
            Gap(12.h),
            CustomDropdown(
              height: 42.h,
              value: createRequestCubit.selectedPaymentSystem,
              items: ["PaymentSystem 1", "PaymentSystem 2", "PaymentSystem 3"],
              onChanged: (val) {
                createRequestCubit.selectPaymentSystem(val);
              },
              hint: LangKeys.unitLocationFromTheFront.tr(),
              itemDisplayBuilder: (paymentSystem) => paymentSystem.toString(),
            ),
            Gap(12.h),
            Text(LangKeys.price.tr(),style: AppStyles.black14Regular,),
            Gap(12.h),
            CustomTextFormField(
              height: 10.h,
              hintText: LangKeys.price.tr(),
            ),
            Gap(12.h),
          ],
        );
      },

    );
  }
}
