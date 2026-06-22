import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/features/broker_features/broker_developers/data/models/developer_projects_model.dart';
import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/broker_text_helper.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperProjectsTableData extends StatelessWidget {
  final List<ProjectData> data;
  const DeveloperProjectsTableData({super.key, required this.data});

  String _cityName(BuildContext context, CityModel? city) {
    if (city == null) return '—';
    return context.locale.languageCode == 'ar' ? city.nameAr : city.nameEn;
  }

  String _areaName(BuildContext context, AreaModel? area) {
    if (area == null) return '—';
    return context.locale.languageCode == 'ar' ? area.nameAr : area.nameEn;
  }

  String _subAreaName(BuildContext context, SubAreaModel? subArea) {
    if (subArea == null) return '—';
    return context.locale.languageCode == 'ar' ? subArea.nameAr : subArea.nameEn;
  }

  String _otherSubAreasText(List<OtherSubAreaModel> list) {
    if (list.isEmpty) return '—';
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
    if (parts.isEmpty) return '—';
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
    return Center(child: icon ?? Text('—', style: AppStyles.black12Medium));
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
        child: Text(label, style: AppStyles.black14SemiBold, textAlign: TextAlign.center),
      ),
      fixedWidth: width.w,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Card(
        elevation: 2,
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: DataTable2(
          columnSpacing: 4.w,
          horizontalMargin: 8.w,
          minWidth: 2400.w,
          dataRowHeight: 56.h,
          headingRowHeight: 48.h,
          headingRowDecoration: BoxDecoration(
            color: AppColors.grayLight.withValues(alpha: 0.3),
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
          ),
          columns: [
            _col(LangKeys.projectName.tr(), 140),
            _col(LangKeys.type.tr(), 110),
            _col(LangKeys.projectType.tr(), 110),
            _col(LangKeys.implementer.tr(), 120),
            _col(LangKeys.city.tr(), 90),
            _col(LangKeys.area.tr(), 90),
            _col(LangKeys.subArea.tr(), 100),
            _col(LangKeys.otherSubArea.tr(), 120),
            _col(LangKeys.address.tr(), 150),
            _col(LangKeys.googleMapsLink.tr(), 100),
            _col(LangKeys.designer.tr(), 100),
            _col(LangKeys.operationManagement.tr(), 130),
            _col(LangKeys.unitsSummary.tr(), 220),
            _col(LangKeys.projectVideo.tr(), 100),
          ],
          rows: List<DataRow>.generate(
            data.length,
            (index) {
              var item = data[index];
              return DataRow(
                color: index.isEven
                    ? WidgetStatePropertyAll(AppColors.grayLight.withValues(alpha: 0.05))
                    : null,
                cells: [
                  DataCell(Text(item.name, style: AppStyles.black12Medium)),
                  DataCell(Text(BrokerTextHelper.projectTypeText(item.type), style: AppStyles.black12Medium)),
                  DataCell(Text(item.projectType, style: AppStyles.black12Medium)),
                  DataCell(Text(item.projectExecutor, style: AppStyles.black12Medium)),
                  DataCell(Text(_cityName(context, item.city), style: AppStyles.black12Medium)),
                  DataCell(Text(_areaName(context, item.area), style: AppStyles.black12Medium)),
                  DataCell(Text(_subAreaName(context, item.subArea), style: AppStyles.black12Medium)),
                  DataCell(Text(_otherSubAreasText(item.otherSubAreas), style: AppStyles.black12Medium)),
                  DataCell(Text(item.address, style: AppStyles.black12Medium)),
                  DataCell(_iconCell(item.googleMapUrl.isNotEmpty ? _urlIcon(Icons.map, item.googleMapUrl) : null)),
                  DataCell(Text(item.designer, style: AppStyles.black12Medium)),
                  DataCell(Text(item.managementTeam, style: AppStyles.black12Medium)),
                  DataCell(Text(_unitsSummary(item), style: AppStyles.black12Medium.copyWith(fontSize: 9.sp))),
                  DataCell(_iconCell(
                    _buildVideoIcon(item.gallery),
                  )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}