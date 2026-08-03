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

  String _areaName(BuildContext context, AreaModel? area) {
    if (area == null) return LangKeys.notAvailable.tr();
    return context.locale.languageCode == 'ar' ? area.nameAr : area.nameEn;
  }

  List<({String label, int count, Color color})> _unitEntries(ProjectData item) {
    final entries = <({String label, int count, Color color})>[];
    void add(String label, int count, Color color) {
      if (count > 0) entries.add((label: label, count: count, color: color));
    }

    add(LangKeys.apartments.tr(), item.apartmentsCount, const Color(0xFF2196F3));
    add(LangKeys.duplexes.tr(), item.duplexesCount, const Color(0xFF9C27B0));
    add(LangKeys.penthouses.tr(), item.penthousesCount, const Color(0xFFFF9800));
    add(LangKeys.iVilla.tr(), item.iVillaCount, const Color(0xFF4CAF50));
    add(LangKeys.studios.tr(), item.studiosCount, const Color(0xFF00BCD4));
    add(LangKeys.roofs.tr(), item.roofsCount, const Color(0xFF795548));
    add(LangKeys.basements.tr(), item.basementsCount, const Color(0xFF607D8B));
    add(LangKeys.twinHouses.tr(), item.twinHousesCount, const Color(0xFFE91E63));
    add(LangKeys.townHouses.tr(), item.townHousesCount, const Color(0xFF3F51B5));
    add(LangKeys.standaloneVillas.tr(), item.standaloneVillasCount, const Color(0xFF8BC34A));
    add(LangKeys.administrativeUnits.tr(), item.administrativeUnitsCount, const Color(0xFFCDDC39));
    add(LangKeys.commercialStores.tr(), item.commercialUnitsCount, const Color(0xFFFF5722));
    add(LangKeys.medicalClinics.tr(), item.medicalClinicsCount, const Color(0xFF009688));
    add(LangKeys.pharmacies.tr(), item.pharmaciesCount, const Color(0xFF673AB7));
    add(LangKeys.commercialAdministrativeBuildings.tr(), item.commercialAdministrativeBuildingCount, const Color(0xFF795548));
    return entries;
  }

  Widget _unitsSummaryWidget(ProjectData item) {
    final entries = _unitEntries(item);
    if (entries.isEmpty) return Text(LangKeys.notAvailable.tr(), style: AppStyles.black12Medium);
    return Wrap(
      spacing: 4.w,
      runSpacing: 4.h,
      children: entries.map((e) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
          decoration: BoxDecoration(
            color: e.color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: e.color.withValues(alpha: 0.3), width: 0.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(e.label, style: AppStyles.black12Medium.copyWith(fontSize: 8.sp, color: e.color.withValues(alpha: 0.8))),
              Gap(2.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: e.color,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text('${e.count}', style: AppStyles.black12Medium.copyWith(fontSize: 7.sp, color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      }).toList(),
    );
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

  DataColumn2 _col(String label, {ColumnSize size = ColumnSize.L}) {
    return DataColumn2(
      label: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Text(label, style: _headerStyle, textAlign: TextAlign.center),
      ),
      size: size,
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
          dataRowHeight: 80.h,
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
            _col("المشروع", size: ColumnSize.S),
            _col("النوع", size: ColumnSize.S),
            _col(LangKeys.projectType.tr(), size: ColumnSize.S),
            _col(LangKeys.implementer.tr(), size: ColumnSize.S),
            _col(LangKeys.area.tr(), size: ColumnSize.S),
            _col(LangKeys.address.tr(), size: ColumnSize.L),
            _col(LangKeys.designer.tr(), size: ColumnSize.S),
            _col("ادارة وصيانة التشغيل", size: ColumnSize.S),
            _col(LangKeys.googleMapsLink.tr(), size: ColumnSize.S),
            _col(LangKeys.unitsSummary.tr(), size: ColumnSize.L),
            _col(LangKeys.projectVideo.tr(), size: ColumnSize.M),
            _col(LangKeys.procedures.tr(), size: ColumnSize.S),
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
                  DataCell(Center(child: Text(item.name, style: AppStyles.black12Medium.copyWith(fontWeight: FontWeight.w600)))),
                  DataCell(Center(child: Text(BrokerTextHelper.projectTypeText(item.type), style: AppStyles.black12Medium))),
                  DataCell(Center(child: _chipCell(BrokerTextHelper.projectTypeText(item.projectType)))),
                  DataCell(Center(child: Text(item.projectExecutor, style: AppStyles.black12Medium))),
                  DataCell(Center(child: Text(_areaName(context, item.area), style: AppStyles.black12Medium))),
                  DataCell(Center(
                    child: Text(
                      item.address,
                      style: AppStyles.black12Medium,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  )),
                  DataCell(Center(child: Text(item.designer, style: AppStyles.black12Medium))),
                  DataCell(Center(child: Text(item.managementTeam, style: AppStyles.black12Medium))),
                  DataCell(_iconCell(item.googleMapUrl.isNotEmpty ? _urlIcon(Icons.map, item.googleMapUrl) : null)),
                  DataCell(Center(child: _unitsSummaryWidget(item))),
                  DataCell(Center(child: _galleryButton(context, item))),
                  DataCell(Center(child: _ProceduresPopupCell(
                    project: item,
                    onModelsTap: onModelsTap,
                    onEditSave: onEditSave,
                  ))),
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

  Widget _galleryButton(BuildContext context, ProjectData item) {
    final images = item.gallery.where((g) => g.type != 'video').toList();
    final hasImages = images.isNotEmpty || item.logoImage.isNotEmpty;
    return InkWell(
      onTap: hasImages ? () => _showGalleryDialog(context, item) : null,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: hasImages ? AppColors.primaryDark.withValues(alpha: 0.08) : Colors.grey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.photo_library_rounded, size: 16.sp, color: hasImages ? AppColors.primaryDark : Colors.grey),
            Gap(4.w),
            Text(
              "عرض الصور",
              style: AppStyles.black12Medium.copyWith(
                fontSize: 10.sp,
                color: hasImages ? AppColors.primaryDark : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showGalleryDialog(BuildContext context, ProjectData item) {
    final allItems = <({String url, String type})>[];
    if (item.logoImage.isNotEmpty) {
      allItems.add((url: item.logoImage, type: 'logo'));
    }
    for (var g in item.gallery) {
      allItems.add((url: g.url, type: g.type));
    }
    showDialog(
      context: context,
      builder: (ctx) {
        final controller = PageController();
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          content: SizedBox(
            width: 0.8.sw,
            height: 0.75.sh,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.photo_library_rounded, color: Colors.white, size: 20.sp),
                      Gap(8.w),
                      Expanded(
                        child: Text(item.name, style: AppStyles.white16SemiBold, maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                      if (allItems.isNotEmpty)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                          decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(12.r)),
                          child: Text("${allItems.length}", style: AppStyles.white14Medium.copyWith(fontSize: 12.sp)),
                        ),
                      Gap(8.w),
                      GestureDetector(
                        onTap: () => Navigator.pop(ctx),
                        child: Container(
                          padding: EdgeInsets.all(4.r),
                          decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(8.r)),
                          child: const Icon(Icons.close_rounded, color: Colors.white, size: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: allItems.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.photo_size_select_actual_rounded, size: 64.h, color: Colors.white24),
                              Gap(12.h),
                              Text("لا توجد صور", style: AppStyles.white14Medium.copyWith(color: Colors.white54)),
                            ],
                          ),
                        )
                      : PageView.builder(
                          controller: controller,
                          itemCount: allItems.length,
                          itemBuilder: (_, index) {
                            final media = allItems[index];
                            if (media.type == 'video') {
                              return Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.videocam_rounded, size: 48.h, color: Colors.white54),
                                    Gap(8.h),
                                    Text("فيديو", style: AppStyles.white14Medium),
                                  ],
                                ),
                              );
                            }
                            return Center(
                              child: Image.network(
                                media.url,
                                fit: BoxFit.contain,
                                loadingBuilder: (_, w, progress) {
                                  if (progress == null) return w;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      value: progress.expectedTotalBytes != null
                                          ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes!
                                          : null,
                                    ),
                                  );
                                },
                                errorBuilder: (_, __, ___) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.broken_image_rounded, size: 48.h, color: Colors.white24),
                                    Gap(8.h),
                                    Text("تعذر تحميل الصورة", style: AppStyles.white14Medium.copyWith(color: Colors.white54, fontSize: 11.sp)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
                if (allItems.length > 1)
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: const BoxDecoration(color: Colors.black87),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.swipe_left_rounded, color: Colors.white54, size: 16.h),
                        Gap(6.w),
                        Text("اسحب للمتابعة", style: AppStyles.white14Medium.copyWith(color: Colors.white54, fontSize: 11.sp)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
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
            // case 'edit':
            //   final updated = await showEditProjectDialog(context, widget.project);
            //   if (updated != null) {
            //     widget.onEditSave?.call(updated);
            //   }
            //   break;
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
