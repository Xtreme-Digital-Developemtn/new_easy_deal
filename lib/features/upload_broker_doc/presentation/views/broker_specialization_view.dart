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
  });

  @override
  State<BrokerSpecializationView> createState() => _BrokerSpecializationViewState();
}

class _BrokerSpecializationViewState extends State<BrokerSpecializationView> {
  final Map<String, List<String>> _selectedScopes = {};
  String? _expandedCategory;

  bool get _hasSelection =>
      _selectedScopes.values.any((list) => list.isNotEmpty);

  void _toggleSubCategory(String category, String subValue) {
    setState(() {
      final list = _selectedScopes.putIfAbsent(category, () => []);
      if (list.contains(subValue)) {
        list.remove(subValue);
      } else {
        list.add(subValue);
      }
    });
  }

  void _toggleAllInCategory(String category, List<String> subOptions) {
    setState(() {
      final list = _selectedScopes.putIfAbsent(category, () => []);
      if (list.length == subOptions.length) {
        list.clear();
      } else {
        list
          ..clear()
          ..addAll(subOptions);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.specialization.tr()),
      body: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, regState) {
          if (regState is SignUpSuccess) {
            context.pushNamedAndRemoveUntil(Routes.layoutView);
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
                  '${LangKeys.specializationScope.tr()} *',
                  style: AppStyles.black16SemiBold,
                ),
                Gap(4.h),
                Text(
                  LangKeys.selectSpecializationScope.tr(),
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
                      final selectedInCategory =
                          _selectedScopes[option.value] ?? [];
                      final isExpanded =
                          _expandedCategory == option.value;
                      final isAllSelected =
                          subOptions.isNotEmpty &&
                          selectedInCategory.length == subOptions.length;

                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: selectedInCategory.isNotEmpty
                                ? AppColors.primaryDark
                                : AppColors.grayLight,
                            width: selectedInCategory.isNotEmpty ? 2 : 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _expandedCategory =
                                      isExpanded ? null : option.value;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 14.h),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () =>
                                          _toggleAllInCategory(
                                              option.value, subOptions),
                                      child: Icon(
                                        isAllSelected
                                            ? Icons.check_box
                                            : selectedInCategory.isNotEmpty
                                                ? Icons.indeterminate_check_box
                                                : Icons
                                                    .check_box_outline_blank,
                                        color: selectedInCategory.isNotEmpty
                                            ? AppColors.primaryDark
                                            : AppColors.gray,
                                        size: 24.r,
                                      ),
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
                                    Icon(
                                      isExpanded
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: AppColors.gray,
                                      size: 24.r,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (isExpanded && subOptions.isNotEmpty)
                              ...subOptions.map(
                                (sub) => GestureDetector(
                                  onTap: () => _toggleSubCategory(
                                      option.value, sub),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 52.w,
                                        right: 16.w,
                                        bottom: 12.h),
                                    child: Row(
                                      children: [
                                        Icon(
                                          selectedInCategory.contains(sub)
                                              ? Icons.check_box
                                              : Icons
                                                  .check_box_outline_blank,
                                          color: selectedInCategory.contains(
                                                  sub)
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
                        ),
                      );
                    },
                  ),
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
    final scopes = <String, List<String>>{};
    _selectedScopes.forEach((key, value) {
      if (value.isNotEmpty) {
        scopes[key] = List.from(value);
      }
    });
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
      specializationScopes: scopes.isNotEmpty ? scopes : null,
      brokerTypeIndex: widget.selectedIndex,
    );
  }
}
