import 'package:easy_deal/features/register/presentation/views/widgets/account_type_widgets/select_account_type.dart';
import 'package:easy_deal/features/register/presentation/views/widgets/account_type_widgets/selection_account_type_button.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class AccountTypeBody extends StatelessWidget {
  const      AccountTypeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectAccountType(),
        Gap(24.h),
        SelectionAccountTypeButton(),
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
        Gap(MediaQuery.of(context).size.height*0.5),
      ],
    );
  }
}
