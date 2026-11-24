import 'package:easy_deal/core/utils/app_consts/app_strings.dart';
import 'package:easy_deal/features/contact_us/presentation/view_model/contact_us_cubit.dart';
import 'package:easy_deal/features/contact_us/presentation/view_model/contact_us_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;

class LegalContactCard extends StatelessWidget {
  const LegalContactCard({super.key, this.showWorkingHours = false});

  final bool showWorkingHours;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsCubit, ContactUsStates>(
      builder: (context, state) {
        final data = context.read<ContactUsCubit>().contactUsModel?.data;
        return _card(
          email: _valueOr(data?.email, AppStrings.companyEmail),
          phone: _valueOr(data?.phone, AppStrings.companyPhone),
        );
      },
    );
  }

  /// Server value when the admin filled it in, otherwise the built-in one,
  /// so the card never ends up empty or showing "null".
  String _valueOr(String? value, String fallback) {
    final trimmed = value?.trim() ?? '';
    return trimmed.isEmpty ? fallback : trimmed;
  }

  Widget _card({required String email, required String phone}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.gray1,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LangKeys.contactUs.tr(), style: AppStyles.black16SemiBold),
          Gap(14.h),
          _ContactRow(
            icon: Icons.language_rounded,
            labelKey: LangKeys.legalWebsite,
            value: AppStrings.companyWebsite,
          ),
          _ContactRow(
            icon: Icons.mail_outline_rounded,
            labelKey: LangKeys.legalEmail,
            value: email,
          ),
          _ContactRow(
            icon: Icons.phone_outlined,
            labelKey: LangKeys.legalPhone,
            value: phone,
          ),
          if (showWorkingHours)
            _ContactRow(
              icon: Icons.schedule_rounded,
              labelKey: LangKeys.legalWorkingHours,
              value: LangKeys.legalWorkingHoursValue.tr(),
              forceLtr: false,
            ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.labelKey,
    required this.value,
    this.forceLtr = true,
  });

  final IconData icon;
  final String labelKey;
  final String value;
  final bool forceLtr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18.sp, color: AppColors.greenDark),
          Gap(10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(labelKey.tr(), style: AppStyles.gray12Medium),
                Gap(2.h),
                Text(
                  value,
                  style: AppStyles.black14Medium,
                  textDirection: forceLtr ? TextDirection.ltr : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
