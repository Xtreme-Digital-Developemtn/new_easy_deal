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
  final String? frontIdPath;
  final String? backIdPath;
  final String? commercialRegistryImagePath;
  final String? taxCardImagePath;

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
    this.frontIdPath,
    this.backIdPath,
    this.commercialRegistryImagePath,
    this.taxCardImagePath,
  });

  @override
  State<BrokerSpecializationView> createState() => _BrokerSpecializationViewState();
}

class _BrokerSpecializationViewState extends State<BrokerSpecializationView> {
  /// التخصص الأساسي: واحد فقط.
  String? _mainCategory;

  /// التخصصات الفرعية التابعة للتخصص الأساسي المختار: متعددة.
  final List<String> _selectedSubs = [];

  bool get _hasSelection => _mainCategory != null && _selectedSubs.isNotEmpty;

  void _selectMainCategory(String category) {
    if (_mainCategory == category) return;
    setState(() {
      _mainCategory = category;
      _selectedSubs.clear();
    });
  }

  void _toggleSubCategory(String subValue) {
    setState(() {
      if (_selectedSubs.contains(subValue)) {
        _selectedSubs.remove(subValue);
      } else {
        _selectedSubs.add(subValue);
      }
    });
  }

  void _toggleAllSubs(List<String> subOptions) {
    setState(() {
      if (_selectedSubs.length == subOptions.length) {
        _selectedSubs.clear();
      } else {
        _selectedSubs
          ..clear()
          ..addAll(subOptions);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.specialization),
      body: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, regState) {
          if (regState is SignUpSuccess) {
            // تسجيل وسيط جديد: إعادة بناء التطبيق بهوية الأكونت الجديد
            // (تاباته بتتبني على الدور المخزّن).
            AppSession.signedIn();
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
                Text(
                  '${LangKeys.mainSpecialization.tr()} *',
                  style: AppStyles.black16SemiBold,
                ),
                Gap(4.h),
                Text(
                  LangKeys.selectMainSpecializationHint.tr(),
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
                      final isMain = _mainCategory == option.value;
                      final isAllSelected = isMain &&
                          subOptions.isNotEmpty &&
                          _selectedSubs.length == subOptions.length;

                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: isMain
                                ? AppColors.primaryDark
                                : AppColors.grayLight,
                            width: isMain ? 2 : 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => _selectMainCategory(option.value),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 14.h),
                                child: Row(
                                  children: [
                                    Icon(
                                      isMain
                                          ? Icons.radio_button_checked
                                          : Icons.radio_button_unchecked,
                                      color: isMain
                                          ? AppColors.primaryDark
                                          : AppColors.gray,
                                      size: 24.r,
                                    ),
                                    Gap(12.w),
                                    Expanded(
                                      child: Text(
                                        option.translationKey != null
                                            ? option.translationKey!.tr()
                                            : option.key,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ),
                                    if (isMain && subOptions.isNotEmpty)
                                      GestureDetector(
                                        onTap: () => _toggleAllSubs(subOptions),
                                        child: Icon(
                                          isAllSelected
                                              ? Icons.check_box
                                              : _selectedSubs.isNotEmpty
                                                  ? Icons.indeterminate_check_box
                                                  : Icons.check_box_outline_blank,
                                          color: _selectedSubs.isNotEmpty
                                              ? AppColors.primaryDark
                                              : AppColors.gray,
                                          size: 22.r,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            if (isMain && subOptions.isNotEmpty) ...[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 52.w, right: 16.w, bottom: 8.h),
                                child: Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    '${LangKeys.subSpecializations.tr()} *',
                                    style: AppStyles.gray12Regular,
                                  ),
                                ),
                              ),
                              ...subOptions.map(
                                (sub) => GestureDetector(
                                  onTap: () => _toggleSubCategory(sub),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 52.w,
                                        right: 16.w,
                                        bottom: 12.h),
                                    child: Row(
                                      children: [
                                        Icon(
                                          _selectedSubs.contains(sub)
                                              ? Icons.check_box
                                              : Icons.check_box_outline_blank,
                                          color: _selectedSubs.contains(sub)
                                              ? AppColors.primaryDark
                                              : AppColors.gray,
                                          size: 20.r,
                                        ),
                                        Gap(8.w),
                                        Expanded(
                                          child: Text(
                                            _subLabel(sub),
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              color: AppColors.black
                                                  .withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ),
                if (_mainCategory != null && _selectedSubs.isEmpty) ...[
                  Gap(8.h),
                  Text(
                    LangKeys.selectAtLeastOneSubSpecialization.tr(),
                    style: AppStyles.gray12Regular
                        .copyWith(color: AppColors.errorDark),
                  ),
                ],
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

  String _subLabel(String value) {
    return value
        .replaceAll('_', ' ')
        .split(' ')
        .map((w) => w.isNotEmpty
            ? '${w[0].toUpperCase()}${w.substring(1)}'
            : '')
        .join(' ');
  }

  void _submit() {
    final scopes = <String, List<String>>{
      _mainCategory!: List<String>.from(_selectedSubs),
    };
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
      idFront: widget.frontIdPath != null
          ? File(widget.frontIdPath!)
          : null,
      idBack: widget.backIdPath != null
          ? File(widget.backIdPath!)
          : null,
      commercialRegistryImage: widget.commercialRegistryImagePath != null
          ? File(widget.commercialRegistryImagePath!)
          : null,
      taxCardImage: widget.taxCardImagePath != null
          ? File(widget.taxCardImagePath!)
          : null,
      specializationScopes: scopes,
      brokerTypeIndex: widget.selectedIndex,
    );
  }
}
