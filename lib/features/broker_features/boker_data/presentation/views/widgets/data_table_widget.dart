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

  DataColumn2 _col(
      String title,
      ColumnSize size,
      ) {
    return DataColumn2(
      size: size,
      label: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.white12Medium.copyWith(
            fontSize: 11.sp,
          ),
        ),
      ),
    );
  }



  String _val(String? value) {
    return (value != null && value.isNotEmpty) ? value : LangKeys.notAvailable.tr();
  }


  Widget _cell(
      String text, {
        double fontSize = 11,
        Color? color,
        FontWeight? weight,
      }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.black12Medium.copyWith(
            fontSize: fontSize.sp,
            color: color,
            fontWeight: weight,
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
    // الـ builder هنا مش بيعتمد على الـ state خالص (الجدول بيتبني من الـ `data`
    // الجاية كـ parameter)، فمفيش أي داعي لعمل rebuild للجدول كله لما الـ state
    // يتغيّر. BlocListener بيسمعله من غير ما يعمل rebuild زيادة عن الحاجة.
    return BlocListener<BrokerDataCubit, BrokerDataStates>(
      listener: (context, state) {
        if (state is GetRequestsCheckAdvertisementCountErrorState) {
          Toast.showErrorToast(msg: state.error, context: context);
          return;
        }

        // ده مجرد تحقق من الـ quota قبل فتح الديالوج، مفيش إعلان اتنشر لسه،
        // فمفيش توست نجاح ولا ريلود هنا.
        if (state is GetRequestsCheckAdvertisementCountSuccessState) {
          final result = state.requestsCheckAdvertisementCountModel!.data!;
          final canCreate = result.canCreateAdvertisement ??
              (result.currentAdvertisementCount! < result.maxAdvertisements!);

          if (!canCreate) {
            Toast.showErrorToast(msg: "لقد تخطيت الحد الاقصى من الاعلانات", context: context);
            return;
          }

          final cubit = context.read<BrokerDataCubit>();
          final selectedUnitId = cubit.selectedUnitId;
          showDialog(
            context: context,
            // كانت هنا bug: بتفتح الديالوج على data[0].id يعني أول صف
            // دايماً، مش الوحدة اللي المستخدم فعلاً ضغط عليها.
            builder: (_) => AdvertisementDialog(unitId: selectedUnitId, cubit: cubit),
          );
        }

        if (state is UnitPublishAsAdSuccessState) {
          Toast.showSuccessToast(msg: "تم نشر الإعلان بنجاح", context: context);
          context.read<BrokerDataCubit>().getBrokerUnits(brokerId: CacheHelper.getData(key: "brokerId"));
        }

        if (state is UnitPublishAsAdErrorState) {
          Toast.showErrorToast(msg: state.error, context: context);
        }

        if (state is UpdateStatusUnitSoldSuccessState) {
          Toast.showSuccessToast(msg: "تم البيع بنجاح", context: context);
          context.read<BrokerDataCubit>().getBrokerUnits(brokerId: CacheHelper.getData(key: "brokerId"));
        }

        if (state is UpdateStatusUnitSoldErrorState) {
          Toast.showErrorToast(msg: state.error, context: context);
        }

        if (state is MakeRequestSuccessState) {
          Toast.showSuccessToast(msg: "تم ارسال الطلب بنجاح", context: context);
          context.read<BrokerDataCubit>().getBrokerUnits(brokerId: CacheHelper.getData(key: "brokerId"));
          final requestId = (state.model as UnitMakeRequestModel).data.id;
          context.pushNamed(Routes.assignToBrokerView, arguments: {"requestId": requestId});
        }

        if (state is MakeRequestErrorState) {
          Toast.showErrorToast(msg: state.error, context: context);
        }

        if (state is UpdateUnitSuccessState) {
          Toast.showSuccessToast(msg: "تم التعديل بنجاح", context: context);
          context.read<BrokerDataCubit>().getBrokerUnits(brokerId: CacheHelper.getData(key: "brokerId"));
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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: Colors.grey.shade200,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: DataTable2(
            minWidth: columns.length * 150,
            columnSpacing: 8,
            horizontalMargin: 10,
            dataRowHeight: 56,
            headingRowHeight: 54,
            showBottomBorder: true,
            border: TableBorder(
              horizontalInside: BorderSide(
                color: Colors.grey.shade200,
              ),
              verticalInside: BorderSide(
                color: Colors.grey.shade100,
              ),
            ),
            headingRowDecoration: BoxDecoration(
              color: AppColors.primaryDark,
            ),
            headingTextStyle: AppStyles.white12Medium.copyWith(
              fontSize: 11.sp,
            ),
            dataTextStyle: AppStyles.black12Medium.copyWith(
              fontSize: 10.sp,
            ),
            dataRowColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.hovered)) {
                return AppColors.primaryLight.withValues(alpha: .08);
              }
              return Colors.transparent;
            }),
            columns: columns,
            rows: List.generate(
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
      _col(LangKeys.ownerName.tr(), ColumnSize.M),
      _col(LangKeys.phoneNumber.tr(), ColumnSize.M),
      _col(LangKeys.compoundType.tr(), ColumnSize.M),
      _col(LangKeys.city.tr(), ColumnSize.S),
      _col(LangKeys.area.tr(), ColumnSize.S),
      _col(LangKeys.transactionType.tr(), ColumnSize.M),
      _col(LangKeys.unitType.tr(), ColumnSize.M),
      _col(LangKeys.unitArea.tr(), ColumnSize.S),
      _col(LangKeys.price.tr(), ColumnSize.M),
      _col(LangKeys.address.tr(), ColumnSize.L),
      _col(LangKeys.images.tr(), ColumnSize.S),
      _col(LangKeys.locationLink.tr(), ColumnSize.S),
      _col(LangKeys.notes.tr(), ColumnSize.L),
      _col(LangKeys.procedures.tr(), ColumnSize.M),
    ];
  }

  DataRow _buildRow(BuildContext context, BrokerUnitData item, int index) {
    return DataRow(
      key: ValueKey(item.id ?? index),
      color: index.isEven
          ? WidgetStatePropertyAll(AppColors.grayLight.withValues(alpha: 0.08))
          : const WidgetStatePropertyAll(Colors.white),
      cells: [
        DataCell(_cell(_val(item.ownerName))),
        DataCell(_cell(_val(item.ownerPhone))),
        DataCell(_cell(_val(BrokerTextHelper.projectTypeText(item.compoundType ?? '')))),
        DataCell(_cell(_val(item.city?.nameAr))),
        DataCell(_cell(_val(item.area?.nameAr))),
        DataCell(_cell(_val(item.unitOperation))),
        DataCell(_cell(_val(item.type))),
        DataCell(_cell(_val(item.unitArea?.toString()))),
        DataCell(_cell(_val(item.totalPriceInCash?.toString()))),
        DataCell(_cell(_val(item.detailedAddress))),
        DataCell(
          GestureDetector(
            onTap: () => _showGalleryDialog(context, item.gallery ?? []),
            child: _cell(LangKeys.images.tr()),
          ),
        ),
        DataCell(
          GestureDetector(
            onTap: () => _openLocation(item.location),
            child: _cell(_val(item.location)),
          ),
        ),
        DataCell(_cell(_val(item.additionalDetails?.notes))),
        DataCell(
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
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
                    context.read<BrokerDataCubit>().makeRequest(
                      id: item.id!,
                      brokerId: CacheHelper.getData(key: "brokerId"),
                    );
                  }
                  break;
                case 'reply':
                  if (item.id != null) {
                    context.pushNamed(
                      Routes.sendReplyView,
                      arguments: {
                        'unitIds': <int>[item.id!],
                        'brokerId': CacheHelper.getData(key: "brokerId"),
                        'senderId': CacheHelper.getData(key: "userId"),
                      },
                    );
                  }
                  break;
              }
            },
            itemBuilder: (context) {
              final items = <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit_outlined),
                      SizedBox(width: 10),
                      Text('تعديل'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'details',
                  child: Row(
                    children: [
                      Icon(Icons.visibility_outlined),
                      SizedBox(width: 10),
                      Text('عرض التفاصيل'),
                    ],
                  ),
                ),
              ];
              if (!item.hasAdvertisers) {
                items.add(
                  const PopupMenuItem<String>(
                    value: 'featured',
                    child: Row(
                      children: [
                        Icon(Icons.campaign_outlined),
                        SizedBox(width: 10),
                        Text('جعله كإعلان'),
                      ],
                    ),
                  ),
                );
              }
              if (item.status != 'sold') {
                items.add(
                  const PopupMenuItem<String>(
                    value: 'sold',
                    child: Row(
                      children: [
                        Icon(Icons.check_circle_outline, color: Colors.green),
                        SizedBox(width: 10),
                        Text('جعله مباع'),
                      ],
                    ),
                  ),
                );
              }
              items.add(
                const PopupMenuItem<String>(
                  value: 'makeRequest',
                  child: Row(
                    children: [
                      Icon(Icons.assignment_outlined),
                      SizedBox(width: 10),
                      Text('جعله كطلب'),
                    ],
                  ),
                ),
              );
              items.add(
                const PopupMenuItem<String>(
                  value: 'reply',
                  child: Row(
                    children: [
                      Icon(Icons.reply_outlined),
                      SizedBox(width: 10),
                      Text('ارسال كرد'),
                    ],
                  ),
                ),
              );
              return items;
            },
          ),
        ),
      ],
    );
  }
}