import 'package:easy_deal/core/shared_cubits/session/app_session.dart';
import 'dart:io';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/create_request/data/stepper_config/stepper_constants.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class BrokerSpecializationView extends StatefulWidget {
  final int selectedIndex;
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String gender;
  final String role;
  final String phone;
  final String? profileImagePath;
  final int? areaId;
  final int? subAreaId;

  const BrokerSpecializationView({
    super.key,
    required this.selectedIndex,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.gender,
    required this.role,
    required this.phone,
    this.profileImagePath,
    this.areaId,
    this.subAreaId,
  });

  @override
  State<BrokerSpecializationView> createState() => _BrokerSpecializationViewState();
}

/// أقصى عدد تخصصات فرعية يقدر الوسيط يختارها عند إنشاء الحساب.
const int _maxSubSpecializations = 4;

class _BrokerSpecializationViewState extends State<BrokerSpecializationView> {
  /// التخصصات الفرعية المختارة من أي تخصص أساسي، من 1 لحد 4.
  /// بنخزّن (التخصص الأساسي + الفرعي) مع بعض لأن نفس التخصص الفرعي ممكن
  /// يتكرر تحت أكتر من تخصص أساسي (مثلاً primary و resale داخل الكمبوند).
  final List<String> _selectedSubs = [];

  String _entry(String category, String sub) => '$category|$sub';

  bool get _hasSelection => _selectedSubs.isNotEmpty;

  bool get _reachedMax => _selectedSubs.length >= _maxSubSpecializations;

  void _toggleSubCategory(String category, String sub) {
    final entry = _entry(category, sub);
    if (_selectedSubs.contains(entry)) {
      setState(() => _selectedSubs.remove(entry));
      return;
    }
    if (_reachedMax) {
      Toast.showErrorToast(
        msg: LangKeys.maxSubSpecializationsReached
            .tr(args: ['$_maxSubSpecializations']),
        context: context,
      );
      return;
    }
    setState(() => _selectedSubs.add(entry));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.specialization),
      body: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, regState) {
          if (regState is SignUpSuccess) {
            // تسجيل وسيط جديد: إعادة بناء التطبيق بهوية الأكونت الجديد
            // (تاباته بتتبني على الدور المخزّن)، ورسالة النجاح بتظهر على
            // الشاشة الجديدة.
            AppSession.signedInWithMessage(
              LangKeys.brokerRegisterSuccessMsg.tr(),
            );
          } else if (regState is SignUpError) {
            Toast.showErrorToast(msg: regState.message, context: context);
          }
        },
        builder: (context, regState) {
          return Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${LangKeys.subSpecializations.tr()} *',
                        style: AppStyles.black16SemiBold,
                      ),
                    ),
                    Text(
                      '${_selectedSubs.length}/$_maxSubSpecializations',
                      style: AppStyles.black14SemiBold.copyWith(
                        color: _reachedMax
                            ? AppColors.errorDark
                            : AppColors.primaryDark,
                      ),
                    ),
                  ],
                ),
                Gap(4.h),
                Text(
                  LangKeys.selectSubSpecializationsHint
                      .tr(args: ['$_maxSubSpecializations']),
                  style: AppStyles.gray12Regular,
                ),
                Gap(20.h),
                Expanded(
                  child: ListView.separated(
                    itemCount: specializationScopeOptions.length,
                    separatorBuilder: (_, __) => Gap(8.h),
                    itemBuilder: (context, index) {
                      final option = specializationScopeOptions[index];
                      final subOptions =
                          specializationScopeSubOptions[option.value] ?? [];

                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: AppColors.grayLight,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // التخصص الأساسي عنوان للمجموعة بس، مش اختيار.
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 14.h),
                              child: Text(
                                option.translationKey != null
                                    ? option.translationKey!.tr()
                                    : option.key,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryDark,
                                ),
                              ),
                            ),
                            ...subOptions.map((sub) {
                              final isSelected =
                                  _selectedSubs.contains(_entry(option.value, sub));
                              final isDisabled = !isSelected && _reachedMax;
                              return GestureDetector(
                                onTap: () =>
                                    _toggleSubCategory(option.value, sub),
                                behavior: HitTestBehavior.opaque,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 16.w, end: 16.w, bottom: 12.h),
                                  child: Row(
                                    children: [
                                      Icon(
                                        isSelected
                                            ? Icons.check_box
                                            : Icons.check_box_outline_blank,
                                        color: isSelected
                                            ? AppColors.primaryDark
                                            : AppColors.gray,
                                        size: 20.r,
                                      ),
                                      Gap(8.w),
                                      Expanded(
                                        child: Text(
                                          sub.toUpperCase().tr(),
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: isDisabled
                                                ? AppColors.gray
                                                : AppColors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Gap(8.h),
                if (_selectedSubs.isEmpty)
                  Text(
                    LangKeys.selectAtLeastOneSubSpecialization.tr(),
                    style: AppStyles.gray12Regular
                        .copyWith(color: AppColors.errorDark),
                  )
                else if (_reachedMax)
                  // رسالة توضيحية مش خطأ: الاختيار صالح، بس مفيش مكان لزيادة.
                  Text(
                    LangKeys.maxSubSpecializationsReached
                        .tr(args: ['$_maxSubSpecializations']),
                    style: AppStyles.gray12Regular
                        .copyWith(color: AppColors.primaryDark),
                  ),
                Gap(20.h),
                if (regState is! SignUpLoading)
                  CustomButton(
                    text: LangKeys.signUp.tr(),
                    onPressed: _hasSelection ? () => _submit() : null,
                  )
                else
                  const CustomLoading(),
              ],
            ),
          );
        },
      ),
    );
  }

  void _submit() {
    // التخصصات الفرعية المختارة بتتجمّع تحت التخصص الأساسي بتاع كل واحدة،
    // فممكن الريكوست يطلع فيه أكتر من تخصص أساسي.
    final scopes = <String, List<String>>{};
    for (final entry in _selectedSubs) {
      final parts = entry.split('|');
      scopes.putIfAbsent(parts.first, () => []).add(parts.last);
    }
    context.read<RegisterCubit>().register(
      fullName: widget.name,
      phone: widget.phone,
      password: widget.password,
      passwordConfirmation: widget.confirmPassword,
      gender: widget.gender,
      email: widget.email,
      image: widget.profileImagePath != null
          ? File(widget.profileImagePath!)
          : null,
      areaIds: widget.areaId != null ? [widget.areaId!] : null,
      subAreas: widget.subAreaId != null ? [widget.subAreaId!] : null,
      specializationScopes: scopes,
      brokerTypeIndex: widget.selectedIndex,
    );
  }
}
