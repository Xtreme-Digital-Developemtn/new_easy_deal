import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';
import '../../view_model/search_cubit.dart';

class PriceFromPriceTo extends StatelessWidget {
  const PriceFromPriceTo({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SearchCubit>();
    return
    Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LangKeys.priceFrom.tr()),
              Gap(4.h),
              CustomTextFormField(
                controller: cubit.priceFromCon,
                hintText: LangKeys.priceFrom.tr(),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        Gap(8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LangKeys.priceTo.tr()),
              Gap(4.h),
              CustomTextFormField(
                controller: cubit.priceToCon,
                hintText: LangKeys.priceTo.tr(),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
