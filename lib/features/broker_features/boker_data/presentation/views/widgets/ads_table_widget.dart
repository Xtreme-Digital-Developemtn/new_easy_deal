import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/broker_features/boker_data/data/models/broker_units_model.dart';
import 'package:easy_deal/features/broker_features/boker_data/data/models/unit_make_request_model.dart';
import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/broker_text_helper.dart';
import 'package:easy_deal/features/broker_features/boker_data/presentation/view_model/broker_data_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../view_model/broker_data_cubit.dart';
import 'advertisement_dialog.dart';
import 'edit_unit_dialog.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({super.key, required this.data});

  final List<BrokerUnitData> data;

  static const _rowHeight = 58.0;
  static const _headingHeight = 50.0;
  static const _grayBorder = BorderSide(color: Color(0xFFE0E0E0), width: 1);
  static const _lightBorder = BorderSide(color: Color(0xFFF5F5F5), width: 1);

  static const _containerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(16)),
    boxShadow: [
      BoxShadow(
        color: Color(0x0F000000),
        blurRadius: 16,
        offset: Offset(0, 6),
      ),
    ],
  );

  void _showMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(LangKeys.noImages.tr()),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(LangKeys.ok.tr()),
          ),
        ],
      ),
    );
  }

  DataColumn2 _col(String label, double width) {
    return DataColumn2(
      label: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(label, style: _headerStyle, textAlign: TextAlign.center),
        ),
      ),
      fixedWidth: width.w,
    );
  }

  static final _headerStyle = AppStyles.black14SemiBold.copyWith(color: AppColors.primaryDark);

  String _val(String? value) {
    return (value != null && value.isNotEmpty) ? value : LangKeys.notAvailable.tr();
  }

  Widget _cell(
    String text, {
    double fontSize = 11,
    Color? color,
    FontWeight? fontWeight,
    TextAlign align = TextAlign.center,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Center(
        child: Text(
          text,
          textAlign: align,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.black12Medium.copyWith(
            fontSize: fontSize.sp,
            color: color,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }

  Widget _chipCell(String text, {Color? bgColor, Color? textColor}) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.primaryDark.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          text,
          style: AppStyles.black12Medium.copyWith(
            fontSize: 10.sp,
            color: textColor ?? AppColors.primaryDark,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _showGalleryDialog(BuildContext context, List<dynamic> gallery) {
    if (gallery.isEmpty) {
      _showMessage(context, LangKeys.noImages.tr());
      return;
    }

    final pageController = PageController();
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        insetPadding: EdgeInsets.all(20.w),
        child: Container(
          height: 500.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              PageView.builder(
                controller: pageController,
                itemCount: gallery.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(16.r),
                  child: InteractiveViewer(
                    minScale: 1,
                    maxScale: 5,
                    child: CachedNetworkImage(
                      imageUrl: gallery[index].toString(),
                      fit: BoxFit.contain,
                      placeholder: (c, _) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (c, _, __) => const Icon(Icons.broken_image, size: 64),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.black54),
                  onPressed: () => Navigator.pop(ctx),
                ),
              ),
              if (gallery.length > 1)
                Positioned(
                  bottom: 12.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        '1 / ${gallery.length}',
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openLocation(String? loc) async {
    if (loc == null || loc.isEmpty) return;
    final uri = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(loc)}",
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BrokerDataCubit, BrokerDataStates>(
      listener: (context, state) {
        if (state is GetRequestsCheckAdvertisementCountErrorState) {
          Toast.showErrorToast(msg: state.error, context: context);
          return;
        }

        if (state is GetRequestsCheckAdvertisementCountSuccessState) {
          final result = state.requestsCheckAdvertisementCountModel!.data!;
          final current = result.currentAdvertisementCount!;
          final max = result.maxAdvertisements!;

          if (current > max) {
            Toast.showErrorToast(msg: "لقد تخطيت الحد الاقصى من الاعلانات", context: context);
            return;
          }

          Toast.showSuccessToast(msg: "تم بنجاح", context: context);
          final cubit = context.read<BrokerDataCubit>();
          final selectedUnitId = cubit.selectedUnitId;
          final brokerId = int.tryParse(CacheHelper.getData(key: "brokerId")?.toString() ?? '') ?? 0;
          cubit.getBrokerUnits(brokerId: brokerId);
          showDialog(
            context: context,
            builder: (_) => AdvertisementDialog(unitId: selectedUnitId, cubit: cubit),
          );
        }

        if (state is UnitPublishAsAdSuccessState) {
          final brokerId = int.tryParse(CacheHelper.getData(key: "brokerId")?.toString() ?? '') ?? 0;
          context.read<BrokerDataCubit>().getBrokerUnits(brokerId: brokerId);
        }

        if (state is UpdateStatusUnitSoldSuccessState) {
          Toast.showSuccessToast(msg: "تم البيع بنجاح", context: context);
          final brokerId = int.tryParse(CacheHelper.getData(key: "brokerId")?.toString() ?? '') ?? 0;
          context.read<BrokerDataCubit>().getBrokerUnits(brokerId: brokerId);
        }

        if (state is UpdateStatusUnitSoldErrorState) {
          Toast.showErrorToast(msg: state.error, context: context);
        }

        if (state is MakeRequestSuccessState) {
          Toast.showSuccessToast(msg: "تم ارسال الطلب بنجاح", context: context);
          final brokerId = int.tryParse(CacheHelper.getData(key: "brokerId")?.toString() ?? '') ?? 0;
          context.read<BrokerDataCubit>().getBrokerUnits(brokerId: brokerId);
          final requestId = (state.model as UnitMakeRequestModel).data.id;
          context.pushNamed(Routes.assignToBrokerView, arguments: {"requestId": requestId});
        }

        if (state is MakeRequestErrorState) {
          Toast.showErrorToast(msg: state.error, context: context);
        }

        if (state is UpdateUnitSuccessState) {
          Toast.showSuccessToast(msg: "تم التعديل بنجاح", context: context);
          final brokerId = int.tryParse(CacheHelper.getData(key: "brokerId")?.toString() ?? '') ?? 0;
          context.read<BrokerDataCubit>().getBrokerUnits(brokerId: brokerId);
        }

        if (state is UpdateUnitErrorState) {
          Toast.showErrorToast(msg: state.error, context: context);
        }
      },
      child: _buildTable(context),
    );
  }

  Widget _buildTable(BuildContext context) {
    final columns = _buildColumns(context);
    return RepaintBoundary(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Container(
          decoration: _containerDecoration,
          clipBehavior: Clip.antiAlias,
          child: DataTable2(
            columnSpacing: 2.w,
            horizontalMargin: 6.w,
            minWidth: 4200.w,
            dataRowHeight: _rowHeight.h,
            headingRowHeight: _headingHeight.h,
            border: const TableBorder(
              horizontalInside: _grayBorder,
              verticalInside: _lightBorder,
            ),
            headingRowDecoration: BoxDecoration(
              color: AppColors.primaryDark.withValues(alpha: 0.1),
            ),
            dataRowColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.hovered)) {
                return AppColors.blueLight.withValues(alpha: 0.3);
              }
              return Colors.transparent;
            }),
            dataTextStyle: AppStyles.black12Medium.copyWith(fontSize: 10.sp),
            columns: columns,
            rows: List<DataRow>.generate(
              data.length,
              (index) => _buildRow(context, data[index], index),
            ),
          ),
        ),
      ),
    );
  }

  List<DataColumn2> _buildColumns(BuildContext context) {
    return [
      _col(LangKeys.ownerName.tr(), 100),
      _col(LangKeys.phoneNumber.tr(), 90),
      _col(LangKeys.compoundType.tr(), 110),
      _col(LangKeys.city.tr(), 80),
      _col(LangKeys.area.tr(), 80),
      _col(LangKeys.transactionType.tr(), 110),
      _col(LangKeys.unitType.tr(), 90),
      _col(LangKeys.unitArea.tr(), 80),
      _col(LangKeys.price.tr(), 90),
      _col(LangKeys.address.tr(), 130),
      _col(LangKeys.images.tr(), 100),
      _col(LangKeys.locationLink.tr(), 100),
      _col(LangKeys.notes.tr(), 120),
      _col(LangKeys.procedures.tr(), 120),
    ];
  }

  DataRow _buildRow(BuildContext context, BrokerUnitData item, int index) {
    final isSold = (item.status?.toString().toLowerCase() == 'sold');
    final hasAdvertisers = (item.advertisers?.isNotEmpty ?? false);

    return DataRow(
      key: ValueKey(item.id ?? index),
      color: index.isEven
          ? WidgetStatePropertyAll(AppColors.grayLight.withValues(alpha: 0.08))
          : const WidgetStatePropertyAll(Colors.white),
      cells: [
        DataCell(_cell(_val(item.ownerName?.toString()), fontWeight: FontWeight.w500)),
        DataCell(_cell(_val(item.ownerPhone?.toString()))),
        DataCell(_chipCell(
          BrokerTextHelper.projectTypeText(item.compoundType?.toString() ?? ''),
          bgColor: _getCompoundTypeColor(item.compoundType?.toString() ?? ''),
        )),
        DataCell(_cell(_val(item.city?.nameAr?.toString()))),
        DataCell(_cell(_val(item.area?.nameAr?.toString()))),
        DataCell(_chipCell(
          BrokerTextHelper.unitOperationText(item.unitOperation?.toString() ?? ''),
          bgColor: _getOperationColor(item.unitOperation?.toString() ?? ''),
        )),
        DataCell(_chipCell(
          BrokerTextHelper.unitTypeText(item.type?.toString() ?? ''),
        )),
        DataCell(_cell(_val(item.unitArea?.toString()), fontWeight: FontWeight.w500)),
        DataCell(_cell(_val(item.totalPriceInCash?.toString()), color: AppColors.primaryDark, fontWeight: FontWeight.w600)),
        DataCell(_cell(_val(item.detailedAddress?.toString()), align: TextAlign.start)),
        DataCell(
          GestureDetector(
            onTap: () => _showGalleryDialog(context, item.gallery ?? []),
            child: _chipCell(
              LangKeys.images.tr(),
              bgColor: (item.gallery?.isNotEmpty ?? false) ? Colors.green.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.1),
              textColor: (item.gallery?.isNotEmpty ?? false) ? Colors.green : Colors.grey,
            ),
          ),
        ),
        DataCell(
          GestureDetector(
            onTap: () => _openLocation(item.location?.toString()),
            child: _chipCell(
              LangKeys.locationLink.tr(),
              bgColor: (item.location?.toString().isNotEmpty ?? false) ? AppColors.primaryDark.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.1),
              textColor: (item.location?.toString().isNotEmpty ?? false) ? AppColors.primaryDark : Colors.grey,
            ),
          ),
        ),
        DataCell(_cell(_val(item.additionalDetails?.notes?.toString()), align: TextAlign.start)),
        DataCell(
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: AppColors.primaryDark, size: 20.sp),
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            onSelected: (value) {
              switch (value) {
                case 'edit':
                  showEditUnitDialog(context, item);
                  break;
                case 'details':
                  context.pushNamed(Routes.unitDetailsView, arguments: {"unitId": item.id});
                  break;
                case 'featured':
                  final cubit = context.read<BrokerDataCubit>();
                  cubit.selectedUnitId = item.id;
                  cubit.requestsCheckAdvertisementCount();
                  break;
                case 'sold':
                  if (item.id != null) {
                    context.read<BrokerDataCubit>().updateStatusUnitSold(id: item.id!);
                  }
                  break;
                case 'makeRequest':
                  if (item.id != null) {
                    final brokerId = int.tryParse(CacheHelper.getData(key: "brokerId")?.toString() ?? '') ?? 0;
                    context.read<BrokerDataCubit>().makeRequest(
                      id: item.id!,
                      brokerId: brokerId,
                    );
                  }
                  break;
                case 'reply':
                  if (item.id != null) {
                    final brokerId = int.tryParse(CacheHelper.getData(key: "brokerId")?.toString() ?? '') ?? 0;
                    final senderId = int.tryParse(CacheHelper.getData(key: "userId")?.toString() ?? '') ?? 0;
                    context.pushNamed(
                      Routes.sendReplyView,
                      arguments: {
                        'unitIds': <int>[item.id!],
                        'brokerId': brokerId,
                        'senderId': senderId,
                      },
                    );
                  }
                  break;
              }
            },
            itemBuilder: (context) {
              final items = <PopupMenuEntry<String>>[
                _buildPopupItem('edit', Icons.edit_outlined, 'تعديل'),
                _buildPopupItem('details', Icons.visibility_outlined, 'عرض التفاصيل'),
              ];
              if (!hasAdvertisers) {
                items.add(_buildPopupItem('featured', Icons.campaign_outlined, 'جعله كإعلان'));
              }
              if (!isSold) {
                items.add(_buildPopupItem('sold', Icons.check_circle_outline, 'جعله مباع', color: Colors.green));
              }
              items.add(_buildPopupItem('makeRequest', Icons.assignment_outlined, 'جعله كطلب'));
              items.add(_buildPopupItem('reply', Icons.reply_outlined, 'ارسال كرد'));
              return items;
            },
          ),
        ),
      ],
    );
  }

  PopupMenuItem<String> _buildPopupItem(String value, IconData icon, String label, {Color? color}) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 20.sp, color: color ?? Colors.black87),
          SizedBox(width: 10.w),
          Text(
            label,
            style: TextStyle(color: color ?? Colors.black87, fontSize: 13.sp),
          ),
        ],
      ),
    );
  }

  Color _getCompoundTypeColor(String type) {
    final t = type.toUpperCase();
    if (t.contains('INSIDE') || t.contains('PRIMARY') || t.contains('RESALE') || t.contains('RENTAL_INSIDE')) {
      return Colors.blue.withValues(alpha: 0.15);
    }
    if (t.contains('OUTSIDE') || t.contains('RENTAL_OUTSIDE')) {
      return Colors.orange.withValues(alpha: 0.15);
    }
    if (t.contains('VILLAGE')) {
      return Colors.green.withValues(alpha: 0.15);
    }
    return AppColors.primaryDark.withValues(alpha: 0.08);
  }

  Color _getOperationColor(String operation) {
    final op = operation.toLowerCase();
    if (op.contains('sell') || op.contains('sale')) {
      return Colors.blue.withValues(alpha: 0.15);
    }
    if (op.contains('rent') || op.contains('lease')) {
      return Colors.green.withValues(alpha: 0.15);
    }
    return AppColors.primaryDark.withValues(alpha: 0.08);
  }
}