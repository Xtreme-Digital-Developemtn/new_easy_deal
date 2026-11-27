import 'package:easy_deal/features/requests/presentation/views/widgets/date_and_type.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/range_and_id.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';
import 'address.dart';
import 'name_and_status.dart';

enum _RequestMenuAction {
  newStatus,
  startProcessing,
  completed,
  assignBroker,
  makeUnit,
}

class RequestListItemCard extends StatefulWidget {
  const RequestListItemCard({
    super.key,
    required this.title,
    required this.statusColor,
    required this.status,
    // required this.date,
    required this.type,
    required this.address,
    required this.range,
    required this.id,
    this.assignedToLabel,
    this.onReturn,
    this.onStatusChanged,
    this.onAssignBrokerTap,
    this.onMakeUnitTap,
    this.onActionCompleted,
  });
  final String title;
  final Color statusColor;
  final String status;
  final String type;
  final String address;
  final String range;
  final int id;
  final String? assignedToLabel;

  /// بيتنده بعد الرجوع من شاشة التفاصيل **بس** لو حصل تغيير جوه التفاصيل
  /// (تحديث حالة / حفظ في الوحدات المباشرة). زرار الرجوع العادي مبيعملش
  /// refresh عشان الليستة متفضلش تعيد تحميل نفسها من الأول كل مرة.
  final VoidCallback? onReturn;

  /// أكشنز تفاصيل الطلب اللي بقت متاحة من هنا برضه عن طريق الـ popup.
  final Future<void> Function(String status)? onStatusChanged;
  final Future<void> Function()? onAssignBrokerTap;
  final Future<void> Function()? onMakeUnitTap;

  /// بيتنده بعد ما الأكشن يخلص والقائمة تقفل، عشان الليستة والعدادات
  /// تتحدثوا من غير ما السياق بتاع القائمة المفتوحة يتدمر في نص الطلب.
  final VoidCallback? onActionCompleted;
  // final DateTime date;

  /// مفاتيح الأكشن مشتركة بين الكارت والـ cubit، عشان مفيش تكرار أو
  /// اختلاف بين مفتاح السبنر ومفتاح منع الضغط المتكرر.
  static String statusActionKey(int requestId, String status) =>
      '$requestId:status:$status';
  static String assignActionKey(int requestId) => '$requestId:assignBroker';
  static String makeUnitActionKey(int requestId) => '$requestId:makeUnit';

  @override
  State<RequestListItemCard> createState() => _RequestListItemCardState();
}

class _RequestListItemCardState extends State<RequestListItemCard> {
  /// مفتاح الأكشن الجاري على **هذا الكارت فقط**، عشان السبنر يظهر على
  /// الزرار اللي اتضغط عليه هو والباقي يفضل زي ما هو.
  final ValueNotifier<String?> _busyKey = ValueNotifier<String?>(null);
  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    _busyKey.dispose();
    super.dispose();
  }

  String _statusKey(String status) =>
      RequestListItemCard.statusActionKey(widget.id, status);
  String get _assignKey => RequestListItemCard.assignActionKey(widget.id);
  String get _makeUnitKey => RequestListItemCard.makeUnitActionKey(widget.id);

  Future<void> _runAction(
    BuildContext menuContext,
    String key,
    Future<void> Function() action, {
    bool keepMenuOpen = true,
  }) async {
    if (_busyKey.value != null) return;
    // التعيين بيفتح شاشة جديدة، فبنقفل القائمة قبل الانتقال.
    if (!keepMenuOpen && menuContext.mounted) {
      Navigator.of(menuContext).pop();
    }
    _busyKey.value = key;
    try {
      await action();
    } finally {
      if (!_disposed) _busyKey.value = null;
      // بنقفل القائمة بعد ما الأكشن يخلص، مش قبل كده، عشان المستخدم يشوف
      // التحميل على الزرار اللي اختاره.
      if (keepMenuOpen && menuContext.mounted) {
        Navigator.of(menuContext).pop();
      }
      // بعد ما القائمة قفلت، دلوقتي آمن نعيد تحميل الليستة.
      widget.onActionCompleted?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () async {
            final changed = await context.pushNamed(Routes.requestDetailsView,arguments: {
              "requestId" : widget.id,
            });
            if (!context.mounted) return;
            // شاشة التفاصيل بترجّع `true` بس لو ات عمل أكشن غيّر الطلب
            if (changed == true) widget.onReturn?.call();
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10.r,
                  offset: Offset(0, 4),
                ),
              ],
              border: Border.all(
                color: Color.fromRGBO(213, 224, 252, 1),
                width: 1.w,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  // مساحة للـ popup على الشمال عشان م يغطيش العنوان
                  padding: EdgeInsets.only(left: 40.r),
                  child: NameAndStatus(
                    title: widget.title,
                    statusColor: widget.statusColor,
                    status: widget.status,
                  ),
                ),
                Gap(12.h),
                DateAndType(
                  // date: date,
                  type: widget.type,),
                Gap(12.h),
                Address(address: widget.address,),
                Gap(12.h),
                RangeAndID(range: widget.range, id: widget.id),
                if (widget.assignedToLabel != null &&
                    widget.assignedToLabel!.isNotEmpty) ...[
                  Gap(8.h),
                  Text(
                    '${LangKeys.assignedToBroker.tr()}: ${widget.assignedToLabel}',
                    style: AppStyles.gray12Medium,
                  ),
                ],
              ],
            ),
          ),
        ),
        Positioned(
          top: 12.r,
          left: 12.r,
          child: _buildActionsMenu(),
        ),
      ],
    );
  }

  Widget _buildActionsMenu() {
    return PopupMenuButton<_RequestMenuAction>(
      tooltip: LangKeys.actions.tr(),
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      icon: Icon(Icons.more_vert, color: AppColors.primaryDark, size: 20.sp),
      itemBuilder: (menuContext) => [
        if (widget.onStatusChanged != null) ...[
          _menuItem(
            menuContext: menuContext,
            value: _RequestMenuAction.newStatus,
            actionKey: _statusKey('new'),
            icon: Icons.fiber_new,
            label: LangKeys.newStatus.tr(),
            action: () => widget.onStatusChanged!('new'),
          ),
          _menuItem(
            menuContext: menuContext,
            value: _RequestMenuAction.startProcessing,
            actionKey: _statusKey('in_processing'),
            icon: Icons.play_arrow,
            label: LangKeys.startProcessing.tr(),
            action: () => widget.onStatusChanged!('in_processing'),
          ),
          _menuItem(
            menuContext: menuContext,
            value: _RequestMenuAction.completed,
            actionKey: _statusKey('finished'),
            icon: Icons.check,
            label: LangKeys.completed.tr(),
            action: () => widget.onStatusChanged!('finished'),
          ),
        ],
        if (widget.onAssignBrokerTap != null)
          _menuItem(
            menuContext: menuContext,
            value: _RequestMenuAction.assignBroker,
            actionKey: _assignKey,
            icon: Icons.group_add_outlined,
            label: LangKeys.assignToBroker.tr(),
            action: () => widget.onAssignBrokerTap!(),
            keepMenuOpen: false,
          ),
        if (widget.onMakeUnitTap != null)
          _menuItem(
            menuContext: menuContext,
            value: _RequestMenuAction.makeUnit,
            actionKey: _makeUnitKey,
            icon: Icons.add_home_work_outlined,
            label: LangKeys.saveToDirectUnits.tr(),
            action: () => widget.onMakeUnitTap!(),
          ),
      ],
    );
  }

  PopupMenuEntry<_RequestMenuAction> _menuItem({
    required BuildContext menuContext,
    required _RequestMenuAction value,
    required String actionKey,
    required IconData icon,
    required String label,
    required Future<void> Function() action,
    bool keepMenuOpen = true,
  }) {
    return _LoadingPopupMenuItem<_RequestMenuAction>(
      value: value,
      onItemTap: () => _runAction(
        menuContext,
        actionKey,
        action,
        keepMenuOpen: keepMenuOpen,
      ),
      child: ValueListenableBuilder<String?>(
        valueListenable: _busyKey,
        builder: (context, busyKey, _) {
          final isBusy = busyKey == actionKey;
          return Row(
            children: [
              if (isBusy)
                SizedBox(
                  width: 16.r,
                  height: 16.r,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.primaryDark),
                  ),
                )
              else
                Icon(icon, size: 18.sp, color: AppColors.primaryDark),
              Gap(8.w),
              Expanded(
                child: Text(
                  label,
                  style: AppStyles.primary14Medium,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// PopupMenuItem عادي بيقفل القائمة أول ما يتداس، فالسبنر مبيظهرش.
/// النسخة دي بتستبدل handleTap عشان القائمة تفضل مفتوحة لحد ما الأكشن
/// يخلص، فيظهر التحميل على الزرار المضغوط بس.
class _LoadingPopupMenuItem<T> extends PopupMenuItem<T> {
  const _LoadingPopupMenuItem({
    super.key,
    super.value,
    required this.onItemTap,
    required super.child,
  });

  final VoidCallback onItemTap;

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() =>
      _LoadingPopupMenuItemState<T>();
}

class _LoadingPopupMenuItemState<T>
    extends PopupMenuItemState<T, PopupMenuItem<T>> {
  @override
  void handleTap() {
    // متستدعيش Navigator.pop هنا، دي حاجة _runAction بيعملها بعد التحميل.
    (widget as _LoadingPopupMenuItem<T>).onItemTap();
  }
}
