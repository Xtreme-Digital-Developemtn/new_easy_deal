// import 'package:easy_deal/features/broker_features/broker_developers/data/models/developer_projects_model.dart';
// import 'package:easy_deal/features/broker_features/broker_developers/presentation/view_model/broker_developers_states.dart';
// import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/broker_text_helper.dart';
// import 'package:easy_deal/main_imports.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../../core/app_services/remote_services/service_locator.dart';
// import '../../../../../../core/utils/toast/toast.dart';
// import '../../view_model/broker_developers_cubit.dart';
//
// // ── قوائم القيم الثابتة (نفس ما يستخدمه BrokerTextHelper) ─────────────────────
//
// const _kTypeValues = [
//   'INSIDE_COMPOUND',
//   'OUTSIDE_COMPOUND',
//   'PRIMARY_INSIDE_COMPOUND',
//   'RESALE_INSIDE_COMPOUND',
//   'RENTALS_OUTSIDE_COMPOUND',
//   'RENTALS_INSIDE_COMPOUND',
// ];
//
// const _kProjectTypeValues = [
//   'RESIDENTIAL',
//   'COMMERCIAL',
//   'ADMINISTRATIVE',
//   'MEDICAL',
//   'MIXED',
//   'VILLAGE',
//   'CHALETS_VACATION_VILLAS',
// ];
//
//
// /// Bottom sheet لتعديل بيانات مشروع موجود، بنفس هوية التصميم المستخدمة
// /// في DeveloperProjectsTableData (AppColors.primaryDark, AppStyles, LangKeys, ScreenUtil).
// ///
// /// الاستخدام من مكان الـ PopupMenu بتاعك:
// ///
// /// case 'edit':
// ///   final updated = await showEditProjectDialog(context, item);
// ///   if (updated != null) {
// ///     // نادِ الـ Cubit/Bloc أو الـ API عشان تحفظ التعديلات
// ///     // مثال: context.read<DeveloperProjectsCubit>().updateProject(updated);
// ///   }
// ///   break;
// Future<ProjectData?> showEditProjectDialog(
//     BuildContext context,
//     ProjectData project,
//     ) {
//   return showModalBottomSheet<ProjectData>(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (ctx) => EditProjectDialog(project: project),
//   );
// }
//
// class EditProjectDialog extends StatefulWidget {
//   final ProjectData project;
//
//   const EditProjectDialog({super.key, required this.project});
//
//   @override
//   State<EditProjectDialog> createState() => _EditProjectDialogState();
// }
//
// class _EditProjectDialogState extends State<EditProjectDialog> {
//   late TextEditingController _nameCtrl;
//   late TextEditingController _executorCtrl;
//   late TextEditingController _designerCtrl;
//   late TextEditingController _managementCtrl;
//   late TextEditingController _addressCtrl;
//   late TextEditingController _googleMapCtrl;
//
//   late String _selectedType;
//   late String _selectedProjectType;
//
//   // عدد الوحدات - نفس الحقول المستخدمة في _unitsSummary
//   late TextEditingController _apartmentsCtrl;
//   late TextEditingController _duplexesCtrl;
//   late TextEditingController _penthousesCtrl;
//   late TextEditingController _iVillaCtrl;
//   late TextEditingController _studiosCtrl;
//   late TextEditingController _roofsCtrl;
//   late TextEditingController _basementsCtrl;
//   late TextEditingController _twinHousesCtrl;
//   late TextEditingController _townHousesCtrl;
//   late TextEditingController _standaloneVillasCtrl;
//   late TextEditingController _administrativeUnitsCtrl;
//   late TextEditingController _commercialUnitsCtrl;
//   late TextEditingController _medicalClinicsCtrl;
//   late TextEditingController _pharmaciesCtrl;
//   late TextEditingController _commercialAdminBuildingCtrl;
//
//   bool get _isValid => _nameCtrl.text.trim().isNotEmpty && _addressCtrl.text.trim().isNotEmpty;
//
//   @override
//   void initState() {
//     super.initState();
//     final p = widget.project;
//     _nameCtrl = TextEditingController(text: p.name);
//     _executorCtrl = TextEditingController(text: p.projectExecutor);
//     _designerCtrl = TextEditingController(text: p.designer);
//     _managementCtrl = TextEditingController(text: p.managementTeam);
//     _addressCtrl = TextEditingController(text: p.address);
//     _googleMapCtrl = TextEditingController(text: p.googleMapUrl);
//
//     // اختر القيمة الحالية أو أول قيمة من القائمة إذا مش موجودة
//     _selectedType = _kTypeValues.contains(p.type.toUpperCase())
//         ? p.type.toUpperCase()
//         : _kTypeValues.first;
//     _selectedProjectType = _kProjectTypeValues.contains(p.projectType.toUpperCase())
//         ? p.projectType.toUpperCase()
//         : _kProjectTypeValues.first;
//
//     _apartmentsCtrl = TextEditingController(text: '${p.apartmentsCount}');
//     _duplexesCtrl = TextEditingController(text: '${p.duplexesCount}');
//     _penthousesCtrl = TextEditingController(text: '${p.penthousesCount}');
//     _iVillaCtrl = TextEditingController(text: '${p.iVillaCount}');
//     _studiosCtrl = TextEditingController(text: '${p.studiosCount}');
//     _roofsCtrl = TextEditingController(text: '${p.roofsCount}');
//     _basementsCtrl = TextEditingController(text: '${p.basementsCount}');
//     _twinHousesCtrl = TextEditingController(text: '${p.twinHousesCount}');
//     _townHousesCtrl = TextEditingController(text: '${p.townHousesCount}');
//     _standaloneVillasCtrl = TextEditingController(text: '${p.standaloneVillasCount}');
//     _administrativeUnitsCtrl = TextEditingController(text: '${p.administrativeUnitsCount}');
//     _commercialUnitsCtrl = TextEditingController(text: '${p.commercialUnitsCount}');
//     _medicalClinicsCtrl = TextEditingController(text: '${p.medicalClinicsCount}');
//     _pharmaciesCtrl = TextEditingController(text: '${p.pharmaciesCount}');
//     _commercialAdminBuildingCtrl =
//         TextEditingController(text: '${p.commercialAdministrativeBuildingCount}');
//
//     for (final c in [_nameCtrl, _addressCtrl]) {
//       c.addListener(() => setState(() {}));
//     }
//   }
//
//   @override
//   void dispose() {
//     _nameCtrl.dispose();
//     _executorCtrl.dispose();
//     _designerCtrl.dispose();
//     _managementCtrl.dispose();
//     _addressCtrl.dispose();
//     _googleMapCtrl.dispose();
//     _apartmentsCtrl.dispose();
//     _duplexesCtrl.dispose();
//     _penthousesCtrl.dispose();
//     _iVillaCtrl.dispose();
//     _studiosCtrl.dispose();
//     _roofsCtrl.dispose();
//     _basementsCtrl.dispose();
//     _twinHousesCtrl.dispose();
//     _townHousesCtrl.dispose();
//     _standaloneVillasCtrl.dispose();
//     _administrativeUnitsCtrl.dispose();
//     _commercialUnitsCtrl.dispose();
//     _medicalClinicsCtrl.dispose();
//     _pharmaciesCtrl.dispose();
//     _commercialAdminBuildingCtrl.dispose();
//     super.dispose();
//   }
//
//   int _toInt(TextEditingController c) => int.tryParse(c.text.trim()) ?? 0;
//
//   void _submit() {
//     if (!_isValid) return;
//     final p = widget.project;
//     final updatedData = p.copyWith(
//       name: _nameCtrl.text.trim(),
//       projectExecutor: _executorCtrl.text.trim(),
//       designer: _designerCtrl.text.trim(),
//       managementTeam: _managementCtrl.text.trim(),
//       address: _addressCtrl.text.trim(),
//       googleMapUrl: _googleMapCtrl.text.trim(),
//       type: _selectedType,
//       projectType: _selectedProjectType,
//       apartmentsCount: _toInt(_apartmentsCtrl),
//       duplexesCount: _toInt(_duplexesCtrl),
//       penthousesCount: _toInt(_penthousesCtrl),
//       iVillaCount: _toInt(_iVillaCtrl),
//       studiosCount: _toInt(_studiosCtrl),
//       roofsCount: _toInt(_roofsCtrl),
//       basementsCount: _toInt(_basementsCtrl),
//       twinHousesCount: _toInt(_twinHousesCtrl),
//       townHousesCount: _toInt(_townHousesCtrl),
//       standaloneVillasCount: _toInt(_standaloneVillasCtrl),
//       administrativeUnitsCount: _toInt(_administrativeUnitsCtrl),
//       commercialUnitsCount: _toInt(_commercialUnitsCtrl),
//       medicalClinicsCount: _toInt(_medicalClinicsCtrl),
//       pharmaciesCount: _toInt(_pharmaciesCtrl),
//       commercialAdministrativeBuildingCount: _toInt(_commercialAdminBuildingCtrl),
//     );
//     context.read<BrokerDevelopersCubit>().updateProject(
//       projectId: p.id,
//       project: updatedData,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<BrokerDevelopersCubit, BrokerDevelopersStates>(
//       listener: (context, state) {
//         if (state is EditProjectSuccess) {
//           Toast.showSuccessToast(msg: "تم التعديل بنجاح", context: context);
//           context.pop();
//           Navigator.of(context).pop(state.project);
//         } else if (state is EditProjectError) {
//           Toast.showErrorToast(msg: state.message, context: context);
//           context.pop();
//         }
//       },
//       builder: (context, state) {
//         final isLoading = state is EditProjectLoading;
//         return _buildSheet(context, isLoading);
//       },
//     );
//   }
//
//   Widget _buildSheet(BuildContext context, bool isLoading) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.9,
//       minChildSize: 0.5,
//       maxChildSize: 0.95,
//       builder: (context, scrollController) {
//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
//           ),
//           child: Column(
//             children: [
//               _buildHandle(),
//               _buildHeader(context),
//               Expanded(
//                 child: SingleChildScrollView(
//                   controller: scrollController,
//                   padding: EdgeInsets.symmetric(horizontal: 20.w),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _sectionTitle(LangKeys.projectName.tr()),
//                       _labeledField(
//                         label: LangKeys.projectName.tr(),
//                         required: true,
//                         child: _textField(_nameCtrl),
//                       ),
//                       Gap(16.h),
//                       _labeledField(
//                         label: LangKeys.implementer.tr(),
//                         child: _textField(_executorCtrl),
//                       ),
//                       Gap(16.h),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: _labeledField(
//                               label: LangKeys.designer.tr(),
//                               child: _textField(_designerCtrl),
//                             ),
//                           ),
//                           Gap(12.w),
//                           Expanded(
//                             child: _labeledField(
//                               label: LangKeys.operationManagement.tr(),
//                               child: _textField(_managementCtrl),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Gap(20.h),
//                       // ── نطاق العقار + نوع المشروع ──────────────────────
//                       _sectionTitle('نطاق العقار'),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: _labeledField(
//                               label: 'نطاق العقار',
//                               child: _dropdownField(
//                                 value: _selectedType,
//                                 items: _kTypeValues,
//                                 onChanged: (v) => setState(() => _selectedType = v!),
//                               ),
//                             ),
//                           ),
//                           Gap(12.w),
//                           Expanded(
//                             child: _labeledField(
//                               label: LangKeys.projectType.tr(),
//                               child: _dropdownField(
//                                 value: _selectedProjectType,
//                                 items: _kProjectTypeValues,
//                                 onChanged: (v) => setState(() => _selectedProjectType = v!),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Gap(20.h),
//                       _sectionTitle(LangKeys.address.tr()),
//                       _labeledField(
//                         label: LangKeys.address.tr(),
//                         required: true,
//                         child: _textField(_addressCtrl),
//                       ),
//                       Gap(16.h),
//                       _labeledField(
//                         label: LangKeys.googleMapsLink.tr(),
//                         child: _textField(_googleMapCtrl, keyboardType: TextInputType.url),
//                       ),
//                       Gap(20.h),
//                       _sectionTitle(LangKeys.unitsSummary.tr()),
//                       _unitCountsGrid(),
//                       Gap(24.h),
//                     ],
//                   ),
//                 ),
//               ),
//               _buildFooter(context, isLoading),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildHandle() {
//     return Padding(
//       padding: EdgeInsets.only(top: 10.h, bottom: 4.h),
//       child: Container(
//         width: 40.w,
//         height: 4.h,
//         decoration: BoxDecoration(
//           color: Colors.grey.shade300,
//           borderRadius: BorderRadius.circular(2.r),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(20.w, 8.h, 12.w, 8.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             LangKeys.edit.tr(),
//             style: AppStyles.black14SemiBold.copyWith(
//               fontSize: 18.sp,
//               color: AppColors.primaryDark,
//             ),
//           ),
//           GestureDetector(
//             onTap: () => Navigator.of(context).pop(),
//             child: Container(
//               width: 36.w,
//               height: 36.h,
//               decoration: BoxDecoration(
//                 color: AppColors.primaryDark.withValues(alpha: 0.08),
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(Icons.close, size: 18.sp, color: AppColors.primaryDark),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _sectionTitle(String title) {
//     return Padding(
//       padding: EdgeInsets.only(top: 12.h, bottom: 8.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title.toUpperCase(),
//             style: AppStyles.black12Medium.copyWith(
//               fontWeight: FontWeight.bold,
//               letterSpacing: 0.5,
//               color: AppColors.primaryDark,
//             ),
//           ),
//           Gap(8.h),
//           Divider(color: AppColors.grayLight.withValues(alpha: 0.6), height: 1),
//         ],
//       ),
//     );
//   }
//
//   Widget _labeledField({required String label, required Widget child, bool required = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(bottom: 8.h),
//           child: RichText(
//             text: TextSpan(
//               text: label,
//               style: AppStyles.black12Medium.copyWith(fontSize: 13.sp, color: Colors.black87),
//               children: required
//                   ? [
//                 TextSpan(
//                   text: ' *',
//                   style: TextStyle(color: Colors.redAccent),
//                 ),
//               ]
//                   : [],
//             ),
//           ),
//         ),
//         child,
//       ],
//     );
//   }
//
//   Widget _textField(
//       TextEditingController controller, {
//         TextInputType keyboardType = TextInputType.text,
//       }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       style: AppStyles.black12Medium.copyWith(fontSize: 14.sp),
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12.r),
//           borderSide: BorderSide(color: AppColors.grayLight.withValues(alpha: 0.8)),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12.r),
//           borderSide: BorderSide(color: AppColors.grayLight.withValues(alpha: 0.8)),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12.r),
//           borderSide: BorderSide(color: AppColors.primaryDark, width: 1.4),
//         ),
//       ),
//     );
//   }
//
//   Widget _dropdownField({
//     required String value,
//     required List<String> items,
//     required void Function(String?) onChanged,
//   }) {
//     return DropdownButtonFormField<String>(
//       value: value,
//       onChanged: onChanged,
//       isExpanded: true,
//       style: AppStyles.black12Medium.copyWith(fontSize: 13.sp),
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12.r),
//           borderSide: BorderSide(color: AppColors.grayLight.withValues(alpha: 0.8)),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12.r),
//           borderSide: BorderSide(color: AppColors.grayLight.withValues(alpha: 0.8)),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12.r),
//           borderSide: BorderSide(color: AppColors.primaryDark, width: 1.4),
//         ),
//       ),
//       items: items.map((v) {
//         return DropdownMenuItem<String>(
//           value: v,
//           child: Text(
//             BrokerTextHelper.projectTypeText(v),
//             style: AppStyles.black12Medium.copyWith(fontSize: 13.sp),
//             overflow: TextOverflow.ellipsis,
//           ),
//         );
//       }).toList(),
//     );
//   }
//
//   Widget _unitCountsGrid() {
//     final fields = <MapEntry<String, TextEditingController>>[
//       MapEntry(LangKeys.apartments.tr(), _apartmentsCtrl),
//       MapEntry(LangKeys.duplexes.tr(), _duplexesCtrl),
//       MapEntry(LangKeys.penthouses.tr(), _penthousesCtrl),
//       MapEntry(LangKeys.iVilla.tr(), _iVillaCtrl),
//       MapEntry(LangKeys.studios.tr(), _studiosCtrl),
//       MapEntry(LangKeys.roofs.tr(), _roofsCtrl),
//       MapEntry(LangKeys.basements.tr(), _basementsCtrl),
//       MapEntry(LangKeys.twinHouses.tr(), _twinHousesCtrl),
//       MapEntry(LangKeys.townHouses.tr(), _townHousesCtrl),
//       MapEntry(LangKeys.standaloneVillas.tr(), _standaloneVillasCtrl),
//       MapEntry(LangKeys.administrativeUnits.tr(), _administrativeUnitsCtrl),
//       MapEntry(LangKeys.commercialStores.tr(), _commercialUnitsCtrl),
//       MapEntry(LangKeys.medicalClinics.tr(), _medicalClinicsCtrl),
//       MapEntry(LangKeys.pharmacies.tr(), _pharmaciesCtrl),
//       MapEntry(LangKeys.commercialAdministrativeBuildings.tr(), _commercialAdminBuildingCtrl),
//     ];
//
//     return Wrap(
//       spacing: 12.w,
//       runSpacing: 16.h,
//       children: fields.map((f) {
//         return SizedBox(
//           width: (ScreenUtil().screenWidth - 40.w - 12.w) / 2,
//           child: _labeledField(
//             label: f.key,
//             child: _textField(f.value, keyboardType: TextInputType.number),
//           ),
//         );
//       }).toList(),
//     );
//   }
//
//   Widget _buildFooter(BuildContext context, bool isLoading) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(
//         20.w,
//         12.h,
//         20.w,
//         12.h + MediaQuery.of(context).viewInsets.bottom.clamp(0, 20),
//       ),
//       decoration: BoxDecoration(
//         border: Border(top: BorderSide(color: AppColors.grayLight.withValues(alpha: 0.6))),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: OutlinedButton(
//               onPressed: isLoading ? null : () => Navigator.of(context).pop(),
//               style: OutlinedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: 14.h),
//                 side: BorderSide(color: AppColors.primaryDark),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.r),
//                 ),
//               ),
//               child: Text(
//                 LangKeys.cancel.tr(),
//                 style: AppStyles.black14SemiBold.copyWith(
//                   color: AppColors.primaryDark,
//                   fontSize: 15.sp,
//                 ),
//               ),
//             ),
//           ),
//           Gap(12.w),
//           Expanded(
//             child: ElevatedButton(
//               onPressed: (_isValid && !isLoading) ? _submit : null,
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: 14.h),
//                 backgroundColor: AppColors.primaryDark,
//                 disabledBackgroundColor: Colors.grey.shade300,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.r),
//                 ),
//                 elevation: 0,
//               ),
//               child: isLoading
//                   ? SizedBox(
//                 width: 18.w,
//                 height: 18.w,
//                 child: const CircularProgressIndicator(
//                   strokeWidth: 2,
//                   color: Colors.white,
//                 ),
//               )
//                   : Text(
//                 LangKeys.save.tr(),
//                 style: AppStyles.black14SemiBold.copyWith(
//                   color: Colors.white,
//                   fontSize: 15.sp,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }