import 'package:easy_deal/features/register/presentation/views/widgets/gender_widgets/select_gender_type.dart';
import 'package:easy_deal/features/register/presentation/views/widgets/gender_widgets/selection_gender_type_button.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class GenderBody extends StatelessWidget {
  const GenderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectGenderType(),
        Gap(24.h),
        SelectionGenderTypeButton(),
        Gap(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LangKeys.bySigningUpIAccept.tr(),style: AppStyles.primary16Medium.copyWith(
              color: AppColors.secondBlack,
            ),),
            Gap(8.w),
            Text(LangKeys.termsOfService.tr(),style: AppStyles.primary16SemiBold,),
          ],
        ),
      ],
    );
  }
}
