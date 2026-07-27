import 'dart:io';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/view_model/broker_developers_cubit.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/view_model/broker_developers_states.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/main_imports.dart';

class ContractRequestDialog extends StatefulWidget {
  final int developerId;

  const ContractRequestDialog({super.key, required this.developerId});

  @override
  State<ContractRequestDialog> createState() => _ContractRequestDialogState();
}

class _ContractRequestDialogState extends State<ContractRequestDialog> {
  @override
  Widget build(BuildContext context) {
    final brokerId = CacheHelper.getData(key: "brokerId") ?? 0;
    final accountType = context.read<ProfileCubit>().clientProfileModel?.data?.type;
    final isCompany = accountType == 'real_estate_brokage_company';

    return BlocConsumer<BrokerDevelopersCubit, BrokerDevelopersStates>(
      listener: (context, state) {
        if (state is ContractRequestSuccessState) {
          final cubit = context.read<BrokerDevelopersCubit>();
          Future.microtask(() {
            try {
              if (context.mounted) {
                Navigator.pop(context);
                Toast.showSuccessToast(msg: state.message, context: context);
              }
              cubit.getDevelopers();
            } catch (_) {}
          });
        }
        if (state is ContractRequestErrorState) {
          Toast.showErrorToast(msg: state.error, context: context);
        }
      },
      builder: (context, state) {
        final cubit = context.read<BrokerDevelopersCubit>();
        final isLoading = state is ContractRequestLoadingState;

        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          insetPadding: EdgeInsets.all(20.w),
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'إرسال طلب عقد',
                    style: AppStyles.black16SemiBold.copyWith(fontSize: 18.sp),
                    textAlign: TextAlign.center,
                  ),
                  Gap(20.h),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      isCompany ? 'شركه' : 'فردي',
                      textAlign: TextAlign.center,
                      style: AppStyles.black14Medium.copyWith(
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Gap(24.h),
                  if (isCompany) ..._buildCompanyFields(cubit),
                  if (!isCompany) ..._buildIndividualFields(cubit),
                  Gap(24.h),
                  CustomButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            cubit.sendContractRequest(
                              brokerId: brokerId,
                              developerId: widget.developerId,
                            );
                          },
                    text: 'إرسال الطلب',
                  ),
                  if (isLoading)
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: const CustomLoading(),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildIndividualFields(BrokerDevelopersCubit cubit) {
    return [
      _buildFileField(
        label: 'الصورة الشخصية',
        file: cubit.contractImage,
        onPick: () => cubit.pickContractImage(),
      ),
      Gap(16.h),
      _buildFileField(
        label: 'صورة البطاقة (وجه أمامي)',
        file: cubit.contractIdFront,
        onPick: () => cubit.pickContractIdFront(),
      ),
      Gap(16.h),
      _buildFileField(
        label: 'صورة البطاقة (وجه خلفي)',
        file: cubit.contractIdBack,
        onPick: () => cubit.pickContractIdBack(),
      ),
    ];
  }

  List<Widget> _buildCompanyFields(BrokerDevelopersCubit cubit) {
    return [
      _buildFileField(
        label: 'صورة السجل التجاري (اختياري)',
        file: cubit.contractCommercialRegistry,
        onPick: () => cubit.pickContractCommercialRegistry(),
      ),
      Gap(16.h),
      _buildFileField(
        label: 'صورة البطاقة الضريبية (اختياري)',
        file: cubit.contractTaxCard,
        onPick: () => cubit.pickContractTaxCard(),
      ),
    ];
  }

  Widget _buildFileField({
    required String label,
    File? file,
    required VoidCallback onPick,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.black14Medium),
        Gap(8.h),
        GestureDetector(
          onTap: onPick,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.grayLight.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: file != null ? AppColors.primaryDark : Colors.grey.shade300,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  file != null ? Icons.check_circle : Icons.cloud_upload_outlined,
                  color: file != null ? Colors.green : AppColors.primaryDark,
                  size: 22.r,
                ),
                Gap(12.w),
                Expanded(
                  child: Text(
                    file != null ? file.path.split('/').last : 'اضغط لاختيار ملف',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppStyles.black14Medium.copyWith(
                      color: file != null ? Colors.black87 : AppColors.grayMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
