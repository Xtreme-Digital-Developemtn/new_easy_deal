import 'package:easy_deal/features/assign_to_broker/presentation/view_model/assign_to_broker_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../view_model/assign_to_broker_cubit.dart';

class _TableCell extends StatelessWidget {
  const _TableCell(this.text, {this.isHeader = false});
  final String text;
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      child: Text(
        text,
        style: isHeader ? AppStyles.black14SemiBold : AppStyles.black12Medium.copyWith(fontSize: 10.sp),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class AssignBrokersList extends StatelessWidget {
  const AssignBrokersList({super.key});

  static String _accountTypeText(String type) {
    switch (type) {
      case 'Free':
      case 'free':
        return LangKeys.freeAccount.tr();
      case 'Silver Account':
      case 'silverAccount':
        return LangKeys.silverAccount.tr();
      case 'Bronze Account':
      case 'bronzeAccount':
        return LangKeys.bronzeAccount.tr();
      case 'Golden Account':
      case 'goldenAccount':
        return LangKeys.goldenAccount.tr();
      default:
        return type;
    }
  }

  static String _typeText(String type) {
    switch (type.toLowerCase().replaceAll(RegExp(r'\s+'), '_')) {
      case 'real_estate_brokage_company':
      case 'real_estate_brokerage_company':
        return LangKeys.realEstateBrokageCompany.tr();
      case 'independent':
        return LangKeys.independent.tr();
      default:
        return type;
    }
  }

  static String _specializationText(String specialization) {
    final key = specialization.toLowerCase().replaceAll(RegExp(r'\s+'), '_').replaceAll('/', '_');
    switch (key) {
      case 'purchasing_sell_residential_outside_compound':
        return LangKeys.purchasingSellResidentialOutsideCompound.tr();
      case 'purchasing_sell_national_housing_projects_outside_compound':
        return LangKeys.purchasingSellNationalHousingProjectsOutsideCompound.tr();
      case 'purchasing_sell_administrative_commercial_units_outside_compound':
        return LangKeys.purchasingSellAdministrativeCommercialUnitsOutsideCompound.tr();
      case 'purchasing_sell_industrial_and_warehousing_outside_compound':
        return LangKeys.purchasingSellIndustrialAndWarehousingOutsideCompound.tr();
      case 'purchasing_sell_lands_and_ready_projects_outside_compound':
        return LangKeys.purchasingSellLandsAndReadyProjectsOutsideCompound.tr();
      case 'purchasing_sell_villas_and_buildings_outside_compound':
        return LangKeys.purchasingSellVillasAndBuildingsOutsideCompound.tr();
      case 'purchasing_sell_vacation_units_outside_compound':
        return LangKeys.purchasingSellVacationUnitsOutsideCompound.tr();
      case 'purchasing_sell_residential_inside_compound':
        return LangKeys.purchasingSellResidentialInsideCompound.tr();
      case 'purchasing_sell_villas_inside_compound':
        return LangKeys.purchasingSellVillasInsideCompound.tr();
      case 'purchasing_sell_administrative_commercial_units_inside_compound':
        return LangKeys.purchasingSellAdministrativeCommercialUnitsInsideCompound.tr();
      case 'purchasing_sell_vacation_units_inside_compound':
        return LangKeys.purchasingSellVacationUnitsInsideCompound.tr();
      case 'rent_residential_inside_compound':
        return LangKeys.rentResidentialInsideCompound.tr();
      case 'rent_hotel_vacation_units_inside_compound':
        return LangKeys.rentHotelVacationUnitsInsideCompound.tr();
      case 'rent_administrative_commercial_units_inside_compound':
        return LangKeys.rentAdministrativeCommercialUnitsInsideCompound.tr();
      case 'rent_residential_outside_compound':
        return LangKeys.rentResidentialOutsideCompound.tr();
      case 'rent_national_housing_projects_outside_compound':
        return LangKeys.rentNationalHousingProjectsOutsideCompound.tr();
      case 'rent_administrative_commercial_units_outside_compound':
        return LangKeys.rentAdministrativeCommercialUnitsOutsideCompound.tr();
      case 'rent_industrial_and_warehousing_outside_compound':
        return LangKeys.rentIndustrialAndWarehousingOutsideCompound.tr();
      case 'rent_hotel_vacation_units_outside_compound':
        return LangKeys.rentHotelVacationUnitsOutsideCompound.tr();
      default:
        return specialization;
    }
  }

  static String _specializationScopeText(String scope) {
    final key = scope.toLowerCase().replaceAll(RegExp(r'\s+'), '_');
    switch (key) {
      case 'purchase_sell_outside_compound':
      case 'purchasing_sell_outside_compound':
        return LangKeys.purchasingSellOutsideCompound.tr();
      case 'purchase_sell_inside_compound':
      case 'purchasing_sell_inside_compound':
        return LangKeys.purchasingSellInsideCompound.tr();
      case 'primary_inside_compound':
        return LangKeys.primaryInsideCompoundKey.tr();
      case 'resale_inside_compound':
        return LangKeys.resaleInsideCompoundKey.tr();
      case 'rentals_outside_compound':
        return LangKeys.rentalsOutsideCompoundKey.tr();
      case 'rentals_inside_compound':
        return LangKeys.rentalsInsideCompoundKey.tr();
      default:
        return scope;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssignToBrokerCubit, AssignToBrokerStates>(
      builder: (context, state) {
        var cubit = context.read<AssignToBrokerCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LangKeys.selectBroker.tr(), style: AppStyles.black16SemiBold),
            Gap(12.h),
            Card(
              elevation: 2,
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Table(
                  columnWidths: const {
                    0: FixedColumnWidth(44),
                    1: FixedColumnWidth(160),
                    2: FixedColumnWidth(120),
                    3: FixedColumnWidth(100),
                    4: FixedColumnWidth(160),
                    5: FixedColumnWidth(140),
                    6: FixedColumnWidth(140),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder(
                    horizontalInside: BorderSide(color: AppColors.grayLight, width: 0.5),
                    bottom: BorderSide(color: AppColors.grayLight, width: 0.5),
                  ),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: AppColors.grayLight.withValues(alpha: 0.2)),
                      children: [
                        Checkbox(
                          value: cubit.selectAll,
                          checkColor: AppColors.white,
                          activeColor: AppColors.primaryDark,
                          onChanged: (_) => cubit.toggleSelectAll(),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                        ),
                        _TableCell(LangKeys.brokerName.tr(), isHeader: true),
                        _TableCell(LangKeys.accountType.tr(), isHeader: true),
                        _TableCell(LangKeys.type.tr(), isHeader: true),
                        _TableCell(LangKeys.area.tr(), isHeader: true),
                        _TableCell(LangKeys.specialization.tr(), isHeader: true),
                        _TableCell(LangKeys.specializationScope.tr(), isHeader: true),
                      ],
                    ),
                    if (cubit.isLoading)
                      TableRow(
                        children: List.filled(7, const Center(child: CircularProgressIndicator())),
                      )
                    else if (cubit.assignBrokersList.isEmpty)
                      TableRow(
                        children: List.filled(7, Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.r),
                            child: Text(LangKeys.thereAreNoItemsCurrentlyAvailable.tr(), style: AppStyles.gray14Medium),
                          ),
                        )),
                      )
                    else
                      ...cubit.assignBrokersList.map((item) {
                        final isSelected = cubit.selectedItems.contains(item);
                        final areas = item.areas.map((a) => context.isArabic ? (a.nameAr ?? '') : (a.nameEn ?? '')).join(' - ');
                        return TableRow(
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primaryDark.withValues(alpha: 0.05) : null,
                          ),
                          children: [
                            Checkbox(
                              value: isSelected,
                              checkColor: AppColors.white,
                              activeColor: AppColors.primaryDark,
                              onChanged: (_) => cubit.toggleItemSelection(item),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                            ),
                            _TableCell(item.fullName),
                            _TableCell(AssignBrokersList._accountTypeText(item.accountType)),
                            _TableCell(AssignBrokersList._typeText(item.type)),
                            _TableCell(areas),
                            _TableCell(item.specializations.map((s) => AssignBrokersList._specializationText(s.specialization ?? '')).join(' - ')),
                            _TableCell(item.specializations.map((s) => AssignBrokersList._specializationScopeText(s.specializationScope ?? '')).where((s) => s.isNotEmpty).join(' - ')),
                          ],
                        );
                      }),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
