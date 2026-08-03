import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/features/broker_features/broker_developers/data/models/developer_projects_model.dart';
import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/broker_text_helper.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

import 'edit_project_dialog.dart';

class DeveloperProjectsTableData extends StatelessWidget {
  final List<ProjectData> data;
  final void Function(int projectId)? onModelsTap;
  final void Function(ProjectData updatedProject)? onEditSave;
  const DeveloperProjectsTableData({super.key, required this.data, this.onModelsTap, this.onEditSave});

  String _cityName(BuildContext context, CityModel? city) {
    if (city == null) return LangKeys.notAvailable.tr();
    return context.locale.languageCode == 'ar' ? city.nameAr : city.nameEn;
  }

  String _areaName(BuildContext context, AreaModel? area) {
    if (area == null) return LangKeys.notAvailable.tr();
    return context.locale.languageCode == 'ar' ? area.nameAr : area.nameEn;
  }

  String _subAreaName(BuildContext context, SubAreaModel? subArea) {
    if (subArea == null) return LangKeys.notAvailable.tr();
    return context.locale.languageCode == 'ar' ? subArea.nameAr : subArea.nameEn;
  }

  String _otherSubAreasText(List<OtherSubAreaModel> list) {
    if (list.isEmpty) return LangKeys.notAvailable.tr();
    return list.map((e) => e.name).join(', ');
  }

  String _unitsSummary(ProjectData item) {
    List<String> parts = [];
    if (item.apartmentsCount > 0) parts.add('${LangKeys.apartments.tr()}: ${item.apartmentsCount}');
    if (item.duplexesCount > 0) parts.add('${LangKeys.duplexes.tr()}: ${item.duplexesCount}');
    if (item.penthousesCount > 0) parts.add('${LangKeys.penthouses.tr()}: ${item.penthousesCount}');
    if (item.iVillaCount > 0) parts.add('${LangKeys.iVilla.tr()}: ${item.iVillaCount}');
    if (item.studiosCount > 0) parts.add('${LangKeys.studios.tr()}: ${item.studiosCount}');
    if (item.roofsCount > 0) parts.add('${LangKeys.roofs.tr()}: ${item.roofsCount}');
    if (item.basementsCount > 0) parts.add('${LangKeys.basements.tr()}: ${item.basementsCount}');
    if (item.twinHousesCount > 0) parts.add('${LangKeys.twinHouses.tr()}: ${item.twinHousesCount}');
    if (item.townHousesCount > 0) parts.add('${LangKeys.townHouses.tr()}: ${item.townHousesCount}');
    if (item.standaloneVillasCount > 0) parts.add('${LangKeys.standaloneVillas.tr()}: ${item.standaloneVillasCount}');
    if (item.administrativeUnitsCount > 0) parts.add('${LangKeys.administrativeUnits.tr()}: ${item.administrativeUnitsCount}');
    if (item.commercialUnitsCount > 0) parts.add('${LangKeys.commercialStores.tr()}: ${item.commercialUnitsCount}');
    if (item.medicalClinicsCount > 0) parts.add('${LangKeys.medicalClinics.tr()}: ${item.medicalClinicsCount}');
    if (item.pharmaciesCount > 0) parts.add('${LangKeys.pharmacies.tr()}: ${item.pharmaciesCount}');
    if (item.commercialAdministrativeBuildingCount > 0) parts.add('${LangKeys.commercialAdministrativeBuildings.tr()}: ${item.commercialAdministrativeBuildingCount}');
    if (parts.isEmpty) return LangKeys.notAvailable.tr();
    return parts.join('\n');
  }

  Widget? _buildVideoIcon(List<GalleryModel> gallery) {
    var url = _projectVideo(gallery);
    if (url.isEmpty) return null;
    return _urlIcon(Icons.play_circle_fill, url);
  }

  String _projectVideo(List<GalleryModel> gallery) {
    if (gallery.isEmpty) return '';
    var videos = gallery.where((g) => g.type == 'video').toList();
    if (videos.isEmpty) return '';
    return videos.first.url;
  }

  Widget _iconCell(Widget? icon) {
    return Center(child: icon ?? Text(LangKeys.notAvailable.tr(), style: AppStyles.black12Medium));
  }

  Widget _urlIcon(IconData icon, String url) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      borderRadius: BorderRadius.circular(6.r),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: AppColors.primaryDark.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Icon(icon, size: 18.h, color: AppColors.primaryDark),
      ),
    );
  }

  DataColumn2 _col(String label, double width) {
    return DataColumn2(
      label: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Text(label, style: _headerStyle, textAlign: TextAlign.center),
      ),
      fixedWidth: width.w,
    );
  }

  static final _headerStyle = AppStyles.black14SemiBold.copyWith(color: AppColors.primaryDark);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.r, 8.r, 16.r, 16.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 8),
              spreadRadius: 0,
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: DataTable2(
          columnSpacing: 4.w,
          horizontalMargin: 12.w,
          minWidth: 2600.w,
          dataRowHeight: 56.h,
          headingRowHeight: 48.h,
          headingTextStyle: _headerStyle,
          headingRowDecoration: BoxDecoration(
            color: AppColors.primaryDark.withValues(alpha: 0.08),
          ),
          dataRowColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return AppColors.blueLight.withValues(alpha: 0.15);
            }
            return null;
          }),
          border: TableBorder(
            horizontalInside: BorderSide(color: Colors.grey.shade100, width: 1),
            verticalInside: BorderSide(color: Colors.grey.shade50, width: 0.5),
          ),
          columns: [
            _col(LangKeys.projectName.tr(), 150),
            _col("نطاق العقار", 100),
            _col(LangKeys.projectType.tr(), 110),
            _col(LangKeys.implementer.tr(), 120),
            // _col(LangKeys.city.tr(), 90),
            _col(LangKeys.area.tr(), 90),
            _col(LangKeys.address.tr(), 150),
            _col(LangKeys.designer.tr(), 100),
            _col(LangKeys.operationManagement.tr(), 130),
            _col(LangKeys.googleMapsLink.tr(), 100),
            _col(LangKeys.unitsSummary.tr(), 220),
            _col(LangKeys.projectVideo.tr(), 80),
            _col(LangKeys.procedures.tr(), 100),
          ],
          rows: List<DataRow>.generate(
            data.length,
                (index) {
              var item = data[index];
              return DataRow(
                color: index.isEven
                    ? WidgetStatePropertyAll(AppColors.grayLight.withValues(alpha: 0.08))
                    : const WidgetStatePropertyAll(Colors.white),
                cells: [
                  DataCell(Text(item.name, style: AppStyles.black12Medium.copyWith(fontWeight: FontWeight.w600))),
                  DataCell(Text(BrokerTextHelper.projectTypeText(item.type), style: AppStyles.black12Medium)),
                  DataCell(_chipCell(BrokerTextHelper.projectTypeText(item.projectType))),
                  DataCell(Text(item.projectExecutor, style: AppStyles.black12Medium)),
                  // DataCell(Text(_cityName(context, item.city), style: AppStyles.black12Medium)),
                  DataCell(Text(_areaName(context, item.area), style: AppStyles.black12Medium)),
                  DataCell(Text(item.address, style: AppStyles.black12Medium)),
                  DataCell(Text(item.designer, style: AppStyles.black12Medium)),
                  DataCell(Text(item.managementTeam, style: AppStyles.black12Medium)),
                  DataCell(_iconCell(item.googleMapUrl.isNotEmpty ? _urlIcon(Icons.map, item.googleMapUrl) : null)),
                  DataCell(Text(_unitsSummary(item), style: AppStyles.black12Medium.copyWith(fontSize: 9.sp))),
                  DataCell(_iconCell(_buildVideoIcon(item.gallery))),
                  DataCell(_ProceduresPopupCell(
                    project: item,
                    onModelsTap: onModelsTap,
                    onEditSave: onEditSave,
                  )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _chipCell(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.primaryDark.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(text, style: AppStyles.black12Medium.copyWith(fontSize: 10.sp)),
    );
  }
}

class _ProceduresPopupCell extends StatefulWidget {
  final ProjectData project;
  final void Function(int projectId)? onModelsTap;
  final void Function(ProjectData updatedProject)? onEditSave;

  const _ProceduresPopupCell({required this.project, this.onModelsTap, this.onEditSave});

  @override
  State<_ProceduresPopupCell> createState() => _ProceduresPopupCellState();
}

class _ProceduresPopupCellState extends State<_ProceduresPopupCell> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final role = context.read<ProfileCubit>().clientProfileModel?.data?.role;
    final isBroker = role == 'broker';
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: PopupMenuButton<String>(
        tooltip: '',
        onSelected: (value) async {
          switch (value) {

            case 'edit':
              if(isBroker)return;
              final updated = await showEditProjectDialog(context, widget.project);
              if (updated != null) {
                widget.onEditSave?.call(updated);
              }
              break;
            case 'models':
              widget.onModelsTap?.call(widget.project.id);
              break;
          }

        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 8,
        offset: const Offset(0, 4),
        color: Colors.white,
        icon: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.all(6.r),
          decoration: BoxDecoration(
            color: _hovering
                ? AppColors.primaryDark.withValues(alpha: 0.15)
                : AppColors.grayLight.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            Icons.more_vert_rounded,
            size: 20.sp,
            color: _hovering ? AppColors.primaryDark : Colors.grey.shade600,
          ),
        ),
        itemBuilder: (context) => [
          if (!isBroker)
          PopupMenuItem<String>(
            value: 'edit',
            height: 44.h,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Icon(Icons.edit_rounded, size: 16.sp, color: AppColors.primaryDark),
                ),
                Gap(10.w),
                Text(LangKeys.edit.tr(), style: AppStyles.black14Medium.copyWith(fontSize: 13.sp)),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'models',
            height: 44.h,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Icon(Icons.dashboard_rounded, size: 16.sp, color: AppColors.primaryDark),
                ),
                Gap(10.w),
                Text(LangKeys.models.tr(), style: AppStyles.black14Medium.copyWith(fontSize: 13.sp)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}