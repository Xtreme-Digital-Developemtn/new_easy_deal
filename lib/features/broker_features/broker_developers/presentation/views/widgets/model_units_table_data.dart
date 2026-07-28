import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/broker_features/boker_data/data/models/broker_units_model.dart';
import 'package:easy_deal/features/broker_features/boker_data/data/models/unit_make_request_model.dart';
import 'package:easy_deal/features/broker_features/boker_data/presentation/view_model/broker_data_cubit.dart';
import 'package:easy_deal/features/broker_features/boker_data/presentation/view_model/broker_data_states.dart';
import 'package:easy_deal/features/broker_features/boker_data/presentation/views/widgets/advertisement_dialog.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/unit_details_from_model_view.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class ModelUnitsTableData extends StatelessWidget {
  final List<BrokerUnitData> data;
  final BrokerDataCubit brokerDataCubit;
  const ModelUnitsTableData({
    super.key,
    required this.data,
    required this.brokerDataCubit,
  });

  static final _headerStyle =
      AppStyles.black14SemiBold.copyWith(color: AppColors.primaryDark);

  DataColumn2 _col(String label, double width) {
    return DataColumn2(
      label: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Text(label, style: _headerStyle, textAlign: TextAlign.center),
      ),
      fixedWidth: width.w,
    );
  }

  Widget _cell(String text) {
    return Text(
      text,
      style: AppStyles.black12Medium,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _chipCell(String text, {Color? color}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: (color ?? AppColors.primaryDark).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        text,
        style: AppStyles.black12Medium.copyWith(
          fontSize: 10.sp,
          color: color ?? AppColors.primaryDark,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _iconLinkCell(String? url) {
    if (url == null || url.isEmpty) {
      return Text(LangKeys.notAvailable.tr(), style: AppStyles.black12Medium);
    }
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
        child: Icon(Icons.map_rounded, size: 18.sp, color: AppColors.primaryDark),
      ),
    );
  }

  Widget _galleryCell(List<dynamic>? gallery) {
    final count = gallery?.length ?? 0;
    if (count == 0) {
      return Text(LangKeys.notAvailable.tr(), style: AppStyles.black12Medium);
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.photo_library_rounded, size: 16.sp, color: AppColors.primaryDark),
        Gap(4.w),
        Text('$count', style: AppStyles.black12Medium),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BrokerDataCubit, BrokerDataStates>(
      bloc: brokerDataCubit,
      listener: (context, state) {
        // جعل كإعلان
        if (state is GetRequestsCheckAdvertisementCountErrorState) {
          Toast.showErrorToast(msg: state.error, context: context);
        }
        if (state is GetRequestsCheckAdvertisementCountSuccessState) {
          final result = state.requestsCheckAdvertisementCountModel!.data!;
          final current = result.currentAdvertisementCount!;
          final max = result.maxAdvertisements!;
          if (current > max) {
            Toast.showErrorToast(
                msg: 'لقد تخطيت الحد الاقصى من الاعلانات', context: context);
            return;
          }
          showDialog(
            context: context,
            builder: (_) => AdvertisementDialog(
              unitId: brokerDataCubit.selectedUnitId,
              cubit: brokerDataCubit,
            ),
          );
        }
        if (state is UnitPublishAsAdSuccessState) {
          Toast.showSuccessToast(msg: 'تم نشر الإعلان بنجاح', context: context);
        }
        if (state is UnitPublishAsAdErrorState) {
          Toast.showErrorToast(msg: state.error, context: context);
        }
        // إرسال طلب
        if (state is MakeRequestSuccessState) {
          Toast.showSuccessToast(msg: 'تم إرسال الطلب بنجاح', context: context);
          final requestId = (state.model as UnitMakeRequestModel).data.id;
          context.pushNamed(
            Routes.assignToBrokerView,
            arguments: {'requestId': requestId},
          );
        }
        if (state is MakeRequestErrorState) {
          Toast.showErrorToast(msg: state.error, context: context);
        }
      },
      child: Padding(
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
            showCheckboxColumn: false,
            columnSpacing: 4.w,
            horizontalMargin: 12.w,
            minWidth: 2800.w,
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
              _col(LangKeys.developerName.tr(), 140),
              _col(LangKeys.projectName.tr(), 140),
              _col(LangKeys.unitType.tr(), 110),
              _col(LangKeys.type.tr(), 110),
              _col(LangKeys.price.tr(), 130),
              _col(LangKeys.unitArea.tr(), 100),
              _col(LangKeys.area.tr(), 110),
              _col(LangKeys.subArea.tr(), 110),
              _col(LangKeys.galleryImages.tr(), 90),
              _col(LangKeys.deliveryStatus.tr(), 130),
              _col(LangKeys.googleMapsLink.tr(), 90),
              _col(LangKeys.notes.tr(), 160),
              _col(LangKeys.actions.tr(), 90),
            ],
            rows: List<DataRow>.generate(
              data.length,
              (index) {
                final item = data[index];
                final na = LangKeys.notAvailable.tr();
                final areaName = context.locale.languageCode == 'ar'
                    ? (item.area?.nameAr ?? na)
                    : (item.area?.nameEn ?? na);
                final subAreaName = context.locale.languageCode == 'ar'
                    ? (item.subArea?.nameAr ?? na)
                    : (item.subArea?.nameEn ?? na);

                return DataRow(
                  color: index.isEven
                      ? WidgetStatePropertyAll(
                          AppColors.grayLight.withValues(alpha: 0.08))
                      : const WidgetStatePropertyAll(Colors.white),
                  cells: [
                    DataCell(_chipCell(item.developerName ?? na)),
                    DataCell(_cell(item.projectName ?? na)),
                    DataCell(_cell(item.type ?? na)),
                    DataCell(_cell(item.unitOperation ?? na)),
                    DataCell(_cell(
                      item.totalPriceInCash != null && item.totalPriceInCash! > 0
                          ? '${item.totalPriceInCash} ${LangKeys.egp.tr()}'
                          : na,
                    )),
                    DataCell(_cell(
                      item.unitArea != null ? '${item.unitArea} m²' : na,
                    )),
                    DataCell(_cell(areaName)),
                    DataCell(_cell(subAreaName)),
                    DataCell(_galleryCell(item.gallery)),
                    DataCell(_cell(item.deliveryDate ?? na)),
                    DataCell(_iconLinkCell(item.location)),
                    DataCell(_cell(item.additionalDetails?.notes ?? na)),
                    DataCell(_ActionsCell(
                      item: item,
                      brokerDataCubit: brokerDataCubit,
                    )),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Actions popup cell ────────────────────────────────────────────────────────

class _ActionsCell extends StatefulWidget {
  final BrokerUnitData item;
  final BrokerDataCubit brokerDataCubit;
  const _ActionsCell({required this.item, required this.brokerDataCubit});

  @override
  State<_ActionsCell> createState() => _ActionsCellState();
}

class _ActionsCellState extends State<_ActionsCell> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: PopupMenuButton<String>(
        tooltip: '',
        onSelected: (value) {
          switch (value) {
            case 'details':
              if (widget.item.id != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UnitDetailsFromModelView(
                      unitId: widget.item.id!,
                    ),
                  ),
                );
              }
              break;
            case 'featured':
              widget.brokerDataCubit.selectedUnitId = widget.item.id;
              widget.brokerDataCubit.requestsCheckAdvertisementCount();
              break;
            case 'makeRequest':
              if (widget.item.id != null) {
                widget.brokerDataCubit.makeRequest(
                  id: widget.item.id!,
                  brokerId: CacheHelper.getData(key: 'brokerId'),
                );
              }
              break;
            case 'reply':
              if (widget.item.id != null) {
                context.pushNamed(
                  Routes.sendReplyView,
                  arguments: {
                    'unitIds': <int>[widget.item.id!],
                    'brokerId': CacheHelper.getData(key: 'brokerId'),
                    'senderId': CacheHelper.getData(key: 'userId'),
                  },
                );
              }
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
        itemBuilder: (context) {
          final items = <PopupMenuEntry<String>>[
            // عرض تفاصيل الوحدة
            PopupMenuItem<String>(
              value: 'details',
              height: 44.h,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.r),
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Icon(Icons.visibility_rounded,
                        size: 16.sp, color: AppColors.primaryDark),
                  ),
                  Gap(10.w),
                  Text(LangKeys.viewDetails.tr(),
                      style: AppStyles.black14Medium.copyWith(fontSize: 13.sp)),
                ],
              ),
            ),
          ];

          // جعل كإعلان — تظهر بس لو مفيش معلنين
          if (!widget.item.hasAdvertisers) {
            items.add(PopupMenuItem<String>(
              value: 'featured',
              height: 44.h,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.r),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Icon(Icons.campaign_rounded,
                        size: 16.sp, color: Colors.orange),
                  ),
                  Gap(10.w),
                  Text('جعل كإعلان',
                      style: AppStyles.black14Medium.copyWith(fontSize: 13.sp)),
                ],
              ),
            ));
          }

          // إرسال طلب
          items.add(PopupMenuItem<String>(
            value: 'makeRequest',
            height: 44.h,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Icon(Icons.assignment_rounded,
                      size: 16.sp, color: Colors.blue),
                ),
                Gap(10.w),
                Text('إرسال طلب',
                    style: AppStyles.black14Medium.copyWith(fontSize: 13.sp)),
              ],
            ),
          ));

          // إرسال رد
          items.add(PopupMenuItem<String>(
            value: 'reply',
            height: 44.h,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Icon(Icons.reply_rounded,
                      size: 16.sp, color: Colors.green),
                ),
                Gap(10.w),
                Text('إرسال رد',
                    style: AppStyles.black14Medium.copyWith(fontSize: 13.sp)),
              ],
            ),
          ));

          return items;
        },
      ),
    );
  }
}
