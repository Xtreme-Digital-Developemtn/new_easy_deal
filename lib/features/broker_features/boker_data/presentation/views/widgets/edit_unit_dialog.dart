import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/broker_features/boker_data/data/models/broker_units_model.dart';
import 'package:easy_deal/features/broker_features/boker_data/presentation/view_model/broker_data_cubit.dart';
import 'package:easy_deal/features/broker_features/boker_data/presentation/view_model/broker_data_states.dart';
import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/broker_text_helper.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

const _kUnitTypes = [
  'apartments',
  'duplexes',
  'penthouses',
  'iVilla',
  'studios',
  'roofs',
  'basements',
  'twinHouses',
  'townHouses',
  'standaloneVillas',
  'administrativeUnits',
  'commercialUnits',
  'medicalClinics',
  'pharmacies',
  'commercialAdministrativeBuilding',
  'commercial_stores',
];

const _kCompoundTypes = [
  'inside_compound',
  'outside_compound',
  'purchasing_sell_inside_compound',
  'purchasing_sell_outside_compound',
  'rentals_inside_compound',
  'rentals_outside_compound',
  'primary_inside_compound',
  'resale_inside_compound',
  'village',
  'residential',
  'commercial',
  'administrative',
  'medical',
  'mixed',
  'chalets_vacation_villas',
];

const _kDeliveryStatuses = [
  'immediate_delivery',
  'under_construction',
  'ready_for_delivery',
];

const _kPaymentSystems = [
  'cash',
  'installment',
  'mixed',
];

const _kViews = [
  'street',
  'garden',
  'pool',
  'sea',
  'landmark',
  'park',
];

Future<void> showEditUnitDialog(BuildContext context, BrokerUnitData unit) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => BlocProvider.value(
      value: context.read<BrokerDataCubit>(),
      child: EditUnitDialog(unit: unit),
    ),
  );
}

class EditUnitDialog extends StatefulWidget {
  final BrokerUnitData unit;
  const EditUnitDialog({super.key, required this.unit});

  @override
  State<EditUnitDialog> createState() => _EditUnitDialogState();
}

class _EditUnitDialogState extends State<EditUnitDialog> {
  late TextEditingController _ownerNameCtrl;
  late TextEditingController _ownerPhoneCtrl;
  late TextEditingController _addressCtrl;
  late TextEditingController _areaCtrl;
  late TextEditingController _priceCtrl;
  late TextEditingController _roomsCtrl;
  late TextEditingController _bathroomsCtrl;
  late TextEditingController _notesCtrl;
  late TextEditingController _locationCtrl;
  late TextEditingController _buildingNumberCtrl;
  late TextEditingController _unitNumberCtrl;
  late TextEditingController _floorCtrl;
  late TextEditingController _finishingTypeCtrl;
  late TextEditingController _mallNameCtrl;
  late TextEditingController _floorNumberCtrl;
  late TextEditingController _shopActivityCtrl;
  late String _selectedType;
  late String _selectedOperation;
  late String _selectedCompoundType;
  late String _selectedDeliveryStatus;
  late String _selectedPaymentSystem;
  late String _selectedView;

  bool get _isValid => _ownerNameCtrl.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    final u = widget.unit;
    _ownerNameCtrl = TextEditingController(text: u.ownerName?.toString() ?? '');
    _ownerPhoneCtrl = TextEditingController(text: u.ownerPhone?.toString() ?? '');
    _addressCtrl = TextEditingController(text: u.detailedAddress?.toString() ?? '');
    _areaCtrl = TextEditingController(text: u.unitArea?.toString() ?? '');
    _priceCtrl = TextEditingController(text: u.totalPriceInCash?.toString() ?? '');
    _roomsCtrl = TextEditingController(text: u.numberOfRooms?.toString() ?? '');
    _bathroomsCtrl = TextEditingController(text: u.numberOfBathrooms?.toString() ?? '');
    _notesCtrl = TextEditingController(text: u.additionalDetails?.notes?.toString() ?? '');
    _locationCtrl = TextEditingController(text: u.location?.toString() ?? '');
    _buildingNumberCtrl = TextEditingController(text: u.buildingNumber?.toString() ?? '');
    _unitNumberCtrl = TextEditingController(text: u.unitNumber?.toString() ?? '');
    _floorCtrl = TextEditingController(text: u.floor?.toString() ?? '');
    _finishingTypeCtrl = TextEditingController(text: u.finishingType?.toString() ?? '');
    _mallNameCtrl = TextEditingController(text: '');
    _floorNumberCtrl = TextEditingController(text: '');
    _shopActivityCtrl = TextEditingController(text: '');

    _selectedType = _kUnitTypes.contains(u.type?.toString().toLowerCase())
        ? u.type.toString().toLowerCase()
        : _kUnitTypes.first;

    _selectedOperation = u.unitOperation?.toString() ?? 'sale';

    _selectedCompoundType = _kCompoundTypes.contains(u.compoundType?.toString().toLowerCase())
        ? u.compoundType.toString().toLowerCase()
        : _kCompoundTypes.first;

    _selectedDeliveryStatus = _kDeliveryStatuses.contains(u.deliveryStatus?.toString())
        ? u.deliveryStatus.toString()
        : _kDeliveryStatuses.first;

    _selectedPaymentSystem = _kPaymentSystems.contains(u.paymentSystem?.toString())
        ? u.paymentSystem.toString()
        : _kPaymentSystems.first;

    _selectedView = _kViews.contains(u.view?.toString())
        ? u.view.toString()
        : _kViews.first;

    _ownerNameCtrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _ownerNameCtrl.dispose();
    _ownerPhoneCtrl.dispose();
    _addressCtrl.dispose();
    _areaCtrl.dispose();
    _priceCtrl.dispose();
    _roomsCtrl.dispose();
    _bathroomsCtrl.dispose();
    _notesCtrl.dispose();
    _locationCtrl.dispose();
    _buildingNumberCtrl.dispose();
    _unitNumberCtrl.dispose();
    _floorCtrl.dispose();
    _finishingTypeCtrl.dispose();
    _mallNameCtrl.dispose();
    _floorNumberCtrl.dispose();
    _shopActivityCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_isValid) return;
    final data = <String, dynamic>{
      'ownerName': _ownerNameCtrl.text.trim(),
      'ownerPhone': _ownerPhoneCtrl.text.trim(),
      'type': _selectedType,
      'unitArea': double.tryParse(_areaCtrl.text.trim()) ?? 0,
      'totalPriceInCash': double.tryParse(_priceCtrl.text.trim()) ?? 0,
      'numberOfRooms': int.tryParse(_roomsCtrl.text.trim()) ?? 0,
      'numberOfBathrooms': int.tryParse(_bathroomsCtrl.text.trim()) ?? 0,
      'detailedAddress': _addressCtrl.text.trim(),
      'unitOperation': _selectedOperation,
      'location': _locationCtrl.text.trim(),
      'compoundType': _selectedCompoundType,
      'buildingNumber': _buildingNumberCtrl.text.trim(),
      'unitNumber': _unitNumberCtrl.text.trim(),
      'floor': _floorCtrl.text.trim(),
      'finishingType': _finishingTypeCtrl.text.trim(),
      'deliveryStatus': _selectedDeliveryStatus,
      'paymentSystem': _selectedPaymentSystem,
      'view': _selectedView,
      'areaId': widget.unit.area?.id,
      'cityId': widget.unit.city?.id,
      'subAreaId': widget.unit.subArea?.id,
      'additionalDetails': {
        'notes': _notesCtrl.text.trim(),
        'mallName': _mallNameCtrl.text.trim(),
        'floorNumber': int.tryParse(_floorNumberCtrl.text.trim()) ?? 0,
        'shopActivity': _shopActivityCtrl.text.trim(),
      },
    };

    debugPrint('================ UPDATE BODY ================');
    debugPrint(data.toString());
    debugPrint('=============================================');

    context.read<BrokerDataCubit>().updateUnit(
      id: widget.unit.id!,
      data: data,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrokerDataCubit, BrokerDataStates>(
      listener: (context, state) {
        if (state is UpdateUnitSuccessState) {
          Toast.showSuccessToast(msg: "تم التعديل بنجاح", context: context);
          Navigator.of(context).pop();
          final brokerId = int.tryParse(CacheHelper.getData(key: "brokerId")?.toString() ?? '') ?? 0;
          context.read<BrokerDataCubit>().getBrokerUnits(
            brokerId: brokerId,
            isRefresh: true,
          );
        } else if (state is UpdateUnitErrorState) {
          Toast.showErrorToast(msg: state.error, context: context);
        }
      },
      builder: (context, state) {
        final isLoading = state is UpdateUnitLoadingState;
        return _buildSheet(context, isLoading);
      },
    );
  }

  Widget _buildSheet(BuildContext context, bool isLoading) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          child: Column(
            children: [
              _buildHandle(),
              _buildHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle(LangKeys.ownerName.tr()),
                      _labeledField(
                        label: LangKeys.ownerName.tr(),
                        required: true,
                        child: _textField(_ownerNameCtrl),
                      ),
                      Gap(16.h),
                      _labeledField(
                        label: LangKeys.phoneNumber.tr(),
                        child: _textField(_ownerPhoneCtrl, keyboardType: TextInputType.phone),
                      ),
                      Gap(16.h),
                      Row(
                        children: [
                          Expanded(
                            child: _labeledField(
                              label: LangKeys.unitType.tr(),
                              child: _dropdownField(
                                value: _selectedType,
                                items: _kUnitTypes,
                                onChanged: (v) => setState(() => _selectedType = v!),
                                displayBuilder: BrokerTextHelper.unitTypeText,
                              ),
                            ),
                          ),
                          Gap(12.w),
                          Expanded(
                            child: _labeledField(
                              label: LangKeys.compoundType.tr(),
                              child: _dropdownField(
                                value: _selectedCompoundType,
                                items: _kCompoundTypes,
                                onChanged: (v) => setState(() => _selectedCompoundType = v!),
                                displayBuilder: BrokerTextHelper.projectTypeText,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(16.h),
                      Row(
                        children: [
                          Expanded(
                            child: _labeledField(
                              label: LangKeys.transactionType.tr(),
                              child: _dropdownField(
                                value: _selectedOperation,
                                items: const ['sale', 'rent'],
                                onChanged: (v) => setState(() => _selectedOperation = v!),
                                displayBuilder: BrokerTextHelper.unitOperationText,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(16.h),
                      Row(
                        children: [
                          Expanded(
                            child: _labeledField(
                              label: 'رقم المبنى',
                              child: _textField(_buildingNumberCtrl),
                            ),
                          ),
                          Gap(12.w),
                          Expanded(
                            child: _labeledField(
                              label: 'رقم الوحدة',
                              child: _textField(_unitNumberCtrl),
                            ),
                          ),
                        ],
                      ),
                      Gap(16.h),
                      Row(
                        children: [
                          Expanded(
                            child: _labeledField(
                              label: 'الدور',
                              child: _textField(_floorCtrl),
                            ),
                          ),
                          Gap(12.w),
                          Expanded(
                            child: _labeledField(
                              label: 'نوع التشطيب',
                              child: _textField(_finishingTypeCtrl),
                            ),
                          ),
                        ],
                      ),
                      Gap(16.h),
                      Row(
                        children: [
                          Expanded(
                            child: _labeledField(
                              label: 'حالة التسليم',
                              child: _dropdownField(
                                value: _selectedDeliveryStatus,
                                items: _kDeliveryStatuses,
                                onChanged: (v) => setState(() => _selectedDeliveryStatus = v!),
                              ),
                            ),
                          ),
                          Gap(12.w),
                          Expanded(
                            child: _labeledField(
                              label: 'نظام الدفع',
                              child: _dropdownField(
                                value: _selectedPaymentSystem,
                                items: _kPaymentSystems,
                                onChanged: (v) => setState(() => _selectedPaymentSystem = v!),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(16.h),
                      Row(
                        children: [
                          Expanded(
                            child: _labeledField(
                              label: 'الإطلالة',
                              child: _dropdownField(
                                value: _selectedView,
                                items: _kViews,
                                onChanged: (v) => setState(() => _selectedView = v!),
                              ),
                            ),
                          ),
                          Gap(12.w),
                          Expanded(
                            child: _labeledField(
                              label: 'المنطقة الفرعية',
                              child: _textField(
                                TextEditingController(text: widget.unit.subArea?.id?.toString() ?? ''),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(20.h),
                      _sectionTitle('تفاصيل إضافية'),
                      Row(
                        children: [
                          Expanded(
                            child: _labeledField(
                              label: 'اسم المول',
                              child: _textField(_mallNameCtrl),
                            ),
                          ),
                          Gap(12.w),
                          Expanded(
                            child: _labeledField(
                              label: 'رقم الدور',
                              child: _textField(_floorNumberCtrl, keyboardType: TextInputType.number),
                            ),
                          ),
                        ],
                      ),
                      Gap(16.h),
                      _labeledField(
                        label: 'نشاط المحل',
                        child: _textField(_shopActivityCtrl),
                      ),
                      Gap(20.h),
                      _sectionTitle(LangKeys.unitArea.tr()),
                      Row(
                        children: [
                          Expanded(
                            child: _labeledField(
                              label: LangKeys.unitArea.tr(),
                              child: _textField(_areaCtrl, keyboardType: TextInputType.number),
                            ),
                          ),
                          Gap(12.w),
                          Expanded(
                            child: _labeledField(
                              label: LangKeys.price.tr(),
                              child: _textField(_priceCtrl, keyboardType: TextInputType.number),
                            ),
                          ),
                        ],
                      ),
                      Gap(16.h),
                      Row(
                        children: [
                          Expanded(
                            child: _labeledField(
                              label: LangKeys.rooms.tr(),
                              child: _textField(_roomsCtrl, keyboardType: TextInputType.number),
                            ),
                          ),
                          Gap(12.w),
                          Expanded(
                            child: _labeledField(
                              label: LangKeys.bathrooms.tr(),
                              child: _textField(_bathroomsCtrl, keyboardType: TextInputType.number),
                            ),
                          ),
                        ],
                      ),
                      Gap(20.h),
                      _sectionTitle(LangKeys.address.tr()),
                      _labeledField(
                        label: LangKeys.address.tr(),
                        child: _textField(_addressCtrl),
                      ),
                      Gap(16.h),
                      _labeledField(
                        label: LangKeys.locationLink.tr(),
                        child: _textField(_locationCtrl),
                      ),
                      Gap(20.h),
                      _sectionTitle(LangKeys.notes.tr()),
                      _labeledField(
                        label: LangKeys.notes.tr(),
                        child: _textField(_notesCtrl, maxLines: 3),
                      ),
                      Gap(24.h),
                    ],
                  ),
                ),
              ),
              _buildFooter(context, isLoading),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHandle() {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 4.h),
      child: Container(
        width: 40.w,
        height: 4.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(2.r),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 8.h, 12.w, 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LangKeys.edit.tr(),
            style: AppStyles.black14SemiBold.copyWith(
              fontSize: 18.sp,
              color: AppColors.primaryDark,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 36.w,
              height: 36.h,
              decoration: BoxDecoration(
                color: AppColors.primaryDark.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, size: 18.sp, color: AppColors.primaryDark),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, bottom: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: AppStyles.black12Medium.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: AppColors.primaryDark,
            ),
          ),
          Gap(8.h),
          Divider(color: AppColors.grayLight.withValues(alpha: 0.6), height: 1),
        ],
      ),
    );
  }

  Widget _labeledField({required String label, required Widget child, bool required = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: RichText(
            text: TextSpan(
              text: label,
              style: AppStyles.black12Medium.copyWith(fontSize: 13.sp, color: Colors.black87),
              children: required
                  ? [const TextSpan(text: ' *', style: TextStyle(color: Colors.redAccent))]
                  : [],
            ),
          ),
        ),
        child,
      ],
    );
  }

  Widget _textField(
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: AppStyles.black12Medium.copyWith(fontSize: 14.sp),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.grayLight.withValues(alpha: 0.8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.grayLight.withValues(alpha: 0.8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primaryDark, width: 1.4),
        ),
      ),
    );
  }

  Widget _dropdownField({
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
    String Function(String)? displayBuilder,
  }) {
    return DropdownButtonFormField<String>(
      value: items.contains(value) ? value : items.first,
      onChanged: onChanged,
      isExpanded: true,
      style: AppStyles.black12Medium.copyWith(fontSize: 13.sp),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.grayLight.withValues(alpha: 0.8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.grayLight.withValues(alpha: 0.8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primaryDark, width: 1.4),
        ),
      ),
      items: items.map((v) {
        return DropdownMenuItem<String>(
          value: v,
          child: Text(
            displayBuilder != null ? displayBuilder(v) : v,
            style: AppStyles.black12Medium.copyWith(fontSize: 13.sp),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFooter(BuildContext context, bool isLoading) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20.w,
        12.h,
        20.w,
        12.h + MediaQuery.of(context).viewInsets.bottom.clamp(0, 20),
      ),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.grayLight.withValues(alpha: 0.6))),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: isLoading ? null : () => Navigator.of(context).pop(),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                side: BorderSide(color: AppColors.primaryDark),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                LangKeys.cancel.tr(),
                style: AppStyles.black14SemiBold.copyWith(
                  color: AppColors.primaryDark,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ),
          Gap(12.w),
          Expanded(
            child: ElevatedButton(
              onPressed: (_isValid && !isLoading) ? _submit : null,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                backgroundColor: AppColors.primaryDark,
                disabledBackgroundColor: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: isLoading
                  ? SizedBox(
                      width: 18.w,
                      height: 18.w,
                      child: const CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : Text(
                      LangKeys.save.tr(),
                      style: AppStyles.black14SemiBold.copyWith(
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
