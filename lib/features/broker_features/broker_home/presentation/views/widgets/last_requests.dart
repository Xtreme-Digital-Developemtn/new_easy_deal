import 'package:easy_deal/features/broker_features/broker_home/presentation/view_model/broker_home_cubit.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/view_model/broker_home_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../broker_features/broker_home/data/models/last_requests_model_in_home.dart';

class LastRequests extends StatefulWidget {
  const LastRequests({
    super.key,
    required this.brokerId,
  });

  final int brokerId;

  @override
  State<LastRequests> createState() => _LastRequestsState();
}

class _LastRequestsState extends State<LastRequests> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final cubit = context.read<BrokerHomeCubit>();
      // يجلب مرة واحدة فقط - لو الداتا موجودة لا يعيد الطلب عند السكرول
      if (cubit.lastRequestsModelInHome == null) {
        cubit.getLastRequestsModelInHome(brokerId: widget.brokerId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<BrokerHomeCubit, BrokerHomeStates>(
      builder: (context, state) {
        final cubit = context.read<BrokerHomeCubit>();
        final lastRequests = cubit.lastRequestsModelInHome;

        // لو الداتا محفوظة بالفعل اعرضها مباشرة بدون انتظار state
        if (lastRequests != null && lastRequests.data.isNotEmpty) {
          if (state is GetLastRequestsModelInHomeLoadingState && lastRequests.data.isEmpty) {
            return const Center(child: CustomLoading());
          }
          final requests = lastRequests.data.whereType<LastRequestItem>().toList();
          if (requests.isEmpty) {
            return Text('لا توجد طلبات', style: AppStyles.black14Medium);
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LangKeys.recentRequests.tr(), style: AppStyles.black16SemiBold),
              Gap(12.h),
              _buildRequestsTable(requests),
            ],
          );
        }

        if (state is GetLastRequestsModelInHomeLoadingState) {
          return const Center(child: CustomLoading());
        }

        if (state is GetLastRequestsModelInHomeErrorState) {
          return Text(
            LangKeys.somethingWentWrong.tr(),
            style: AppStyles.black14Medium,
          );
        }

        if (state is GetLastRequestsModelInHomeSuccessState) {
          final requests = (lastRequests?.data ?? [])
              .whereType<LastRequestItem>()
              .toList();

          if (requests.isEmpty) {
            return Text(
              'لا توجد طلبات',
              style: AppStyles.black14Medium,
            );
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LangKeys.recentRequests.tr(),
                style: AppStyles.black16SemiBold,
              ),
              Gap(12.h),
              _buildRequestsTable(requests),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  // ====== جدول بعناوين ثابتة + سكرول أفقي فقط بدون تضارب ======
  static const double _minTableWidth = 860;

  Widget _buildRequestsTable(List<LastRequestItem> requests) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryDark,
                    AppColors.primaryDark.withValues(alpha: 0.85),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.receipt_long_rounded, color: Colors.white, size: 22.sp),
                  Gap(10.w),
                  Text(
                    LangKeys.recentRequests.tr(),
                    style: AppStyles.black14Medium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      '${requests.length} ${LangKeys.requests.tr()}',
                      style: AppStyles.black14Medium.copyWith(color: Colors.white, fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              color: Colors.amber.withValues(alpha: 0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.swipe_rounded, size: 14.sp, color: Colors.grey.shade600),
                  Gap(6.w),
                  Text('اسحب يمين / شمال لعرض باقي الأعمدة',
                      style: AppStyles.black12Medium.copyWith(fontSize: 10.sp, color: Colors.grey.shade700)),
                ],
              ),
            ),
            Scrollbar(
              thumbVisibility: false,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                child: SizedBox(
                  width: _minTableWidth.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTableHeader(),
                      Divider(height: 1, color: Colors.grey.shade200),
                      ...requests.asMap().entries.map((entry) {
                        final index = entry.key;
                        final request = entry.value;
                        return _buildRow(request, index.isEven);
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // العناوين المطلوبة فقط: الطلب + الاسم + التاريخ + نوع الحساب + الحالة
  Widget _buildTableHeader() {
    return Container(
      height: 48.h,
      color: AppColors.primaryDark.withValues(alpha: 0.08),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [
          _headerCell('الطلب', 200.w, Icons.request_page_outlined),
          _headerCell('الاسم', 160.w, Icons.person_outline_rounded),
          _headerCell('التاريخ', 150.w, Icons.calendar_today_outlined),
          _headerCell('نوع الحساب', 170.w, Icons.account_circle_outlined),
          _headerCell('الحالة', 140.w, Icons.flag_outlined),
        ],
      ),
    );
  }

  Widget _headerCell(String label, double width, IconData icon) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 14.sp, color: AppColors.primaryDark),
          Gap(4.w),
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppStyles.black14Medium.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(LastRequestItem request, bool isEven) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: isEven ? Colors.white : AppColors.grayLight.withValues(alpha: 0.06),
        border: Border(bottom: BorderSide(color: Colors.grey.shade100, width: 0.5)),
      ),
      child: Row(
        children: [
          _dataCell(width: 200.w, child: Text(
            _getTitleArabic(request),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppStyles.black14Medium.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600),
          )),
          _dataCell(width: 160.w, child: Text(
            (request.user?.name?.trim().isNotEmpty == true) ? request.user!.name! : 'غير متوفر',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppStyles.black14Medium.copyWith(fontSize: 12.sp),
          )),
          _dataCell(width: 150.w, child: Text(
            _formatDate(request.createdAt),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.black14Medium.copyWith(fontSize: 11.sp, color: AppColors.primaryDark.withValues(alpha: 0.7)),
          )),
          _dataCell(width: 170.w, child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.primaryDark.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              _getRoleArabic(request.user?.role),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppStyles.black14Medium.copyWith(
                fontSize: 11.sp, color: AppColors.primaryDark, fontWeight: FontWeight.w600),
            ),
          )),
          _dataCell(width: 140.w, child: _buildStatus(request.status)),
        ],
      ),
    );
  }

  Widget _dataCell({required double width, required Widget child}) {
    return SizedBox(width: width, child: Center(child: child));
  }

  String _getTitleArabic(LastRequestItem request) {
    final title = request.title ?? '';
    if (title.isEmpty) return '-';

    const titleMap = {
      'Purchasing Apartments': 'شراء شقق',
      'Selling Apartments': 'بيع شقق',
      'Renting Apartments': 'إيجار شقق',
      'Purchasing Villas': 'شراء فيلا',
      'Selling Villas': 'بيع فيلا',
      'Renting Villas': 'إيجار فيلا',
      'Purchasing Land': 'شراء أرض',
      'Selling Land': 'بيع أرض',
      'Purchasing Pharmacies': 'شراء صيدليات',
      'Selling Pharmacies': 'بيع صيدليات',
      'Purchasing Stores': 'شراء محلات',
      'Selling Stores': 'بيع محلات',
      'Purchasing Administrative Units': 'شراء وحدات إدارية',
      'Selling Administrative Units': 'بيع وحدات إدارية',
      'Purchasing Commercial Units': 'شراء وحدات تجارية',
      'Selling Commercial Units': 'بيع وحدات تجارية',
      'Purchasing Penthouses': 'شراء بنتهاوس',
      'Selling Penthouses': 'بيع بنتهاوس',
      'Purchasing Duplexes': 'شراء دوبلكس',
      'Selling Duplexes': 'بيع دوبلكس',
      'Purchasing Studios': 'شراء ستوديو',
      'Selling Studios': 'بيع ستوديو',
      'Purchasing Chalets': 'شراء شاليه',
      'Selling Chalets': 'بيع شاليه',
      'Purchasing Hotels': 'شراء فنادق',
      'Selling Hotels': 'بيع فنادق',
      'Purchasing Buildings': 'شراء مباني',
      'Selling Buildings': 'بيع مباني',
      'Purchasing Roofs': 'شراء أسطح',
      'Selling Roofs': 'بيع أسطح',
      'Purchasing Basements': 'شراء أقبية',
      'Selling Basements': 'بيع أقبية',
    };

    if (titleMap.containsKey(title)) {
      return titleMap[title]!;
    }

    final lower = title.toLowerCase().trim();

    if (lower.contains('purchasing') || lower.contains('buying')) {
      if (lower.contains('apartment')) return 'شراء شقق';
      if (lower.contains('villa')) return 'شراء فيلا';
      if (lower.contains('land')) return 'شراء أرض';
      if (lower.contains('pharmacy') || lower.contains('pharmacies')) {
        return 'شراء صيدليات';
      }
      if (lower.contains('store') || lower.contains('stores')) {
        return 'شراء محلات';
      }
      if (lower.contains('penthouse')) return 'شراء بنتهاوس';
      if (lower.contains('duplex')) return 'شراء دوبلكس';
      if (lower.contains('studio')) return 'شراء ستوديو';
      if (lower.contains('chalet')) return 'شراء شاليه';
      if (lower.contains('hotel')) return 'شراء فنادق';
      if (lower.contains('building')) return 'شراء مباني';
      if (lower.contains('roof')) return 'شراء أسطح';
      if (lower.contains('basement')) return 'شراء أقبية';
      if (lower.contains('administrative')) return 'شراء وحدات إدارية';
      if (lower.contains('commercial')) return 'شراء وحدات تجارية';
      return 'شراء عقار';
    }

    if (lower.contains('selling') || lower.contains('sell')) {
      if (lower.contains('apartment')) return 'بيع شقق';
      if (lower.contains('villa')) return 'بيع فيلا';
      if (lower.contains('land')) return 'بيع أرض';
      if (lower.contains('pharmacy') || lower.contains('pharmacies')) {
        return 'بيع صيدليات';
      }
      if (lower.contains('store') || lower.contains('stores')) {
        return 'بيع محلات';
      }
      if (lower.contains('penthouse')) return 'بيع بنتهاوس';
      if (lower.contains('duplex')) return 'بيع دوبلكس';
      if (lower.contains('studio')) return 'بيع ستوديو';
      if (lower.contains('chalet')) return 'بيع شاليه';
      if (lower.contains('hotel')) return 'بيع فنادق';
      if (lower.contains('building')) return 'بيع مباني';
      if (lower.contains('roof')) return 'بيع أسطح';
      if (lower.contains('basement')) return 'بيع أقبية';
      if (lower.contains('administrative')) return 'بيع وحدات إدارية';
      if (lower.contains('commercial')) return 'بيع وحدات تجارية';
      return 'بيع عقار';
    }

    if (lower.contains('renting') || lower.contains('rent')) {
      if (lower.contains('apartment')) return 'إيجار شقق';
      if (lower.contains('villa')) return 'إيجار فيلا';
      return 'إيجار عقار';
    }

    return title;
  }

  String _getRoleArabic(String? role) {
    if (role == null || role.trim().isEmpty) return 'غير محدد';
    final r = role.toLowerCase().trim();
    switch (r) {
      case 'broker':
      case 'individual':
        return 'وسيط';
      case 'realestatebrokagecompany':
      case 'real_estate_brokage_company':
      case 'company':
        return 'شركة وساطة عقارية';
      case 'client':
      case 'user':
        return 'عميل';
      case 'developer':
        return 'مطور';
      case 'admin':
        return 'مسؤول';
      default:
        if (RegExp(r'[\u0600-\u06FF]').hasMatch(role)) return role;
        return role;
    }
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return '-';

    const months = {
      'Jan': 'يناير',
      'Feb': 'فبراير',
      'Mar': 'مارس',
      'Apr': 'أبريل',
      'May': 'مايو',
      'Jun': 'يونيو',
      'Jul': 'يوليو',
      'Aug': 'أغسطس',
      'Sep': 'سبتمبر',
      'Oct': 'أكتوبر',
      'Nov': 'نوفمبر',
      'Dec': 'ديسمبر',
    };

    if (dateStr.contains('T')) {
      try {
        final date = DateTime.parse(dateStr);
        return '${date.day}/${date.month}/${date.year}';
      } catch (_) {
        return dateStr;
      }
    }

    for (final entry in months.entries) {
      if (dateStr.contains(entry.key)) {
        return dateStr.replaceAll(entry.key, entry.value);
      }
    }

    return dateStr;
  }

  Widget _buildStatus(String? status) {
    final text = _getStatusText(status);
    final colors = _getStatusColors(status);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(color: colors.bg, borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 6.w, height: 6.w, decoration: BoxDecoration(color: colors.dot, shape: BoxShape.circle)),
          Gap(4.w),
          Text(text, style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: colors.text)),
        ],
      ),
    );
  }

  ({Color bg, Color dot, Color text}) _getStatusColors(String? status) {
    final s = status?.toLowerCase().trim() ?? '';
    if (s == 'finished' || s == 'completed' || s == 'done') {
      return (bg: Colors.green.withValues(alpha: 0.10), dot: Colors.green, text: Colors.green.shade700);
    }
    if (s == 'in_process' || s == 'in_progress' || s == 'processing') {
      return (bg: Colors.blue.withValues(alpha: 0.10), dot: Colors.blue, text: Colors.blue.shade700);
    }
    if (s == 'pending' || s == 'new') {
      return (bg: Colors.orange.withValues(alpha: 0.10), dot: Colors.orange, text: Colors.orange.shade700);
    }
    if (s == 'assigned') {
      return (bg: AppColors.primaryDark.withValues(alpha: 0.10), dot: AppColors.primaryDark, text: AppColors.primaryDark);
    }
    if (s == 'cancelled' || s == 'canceled' || s == 'rejected') {
      return (bg: Colors.red.withValues(alpha: 0.10), dot: Colors.red, text: Colors.red.shade700);
    }
    return (bg: AppColors.orangeOriginal.withValues(alpha: 0.10), dot: AppColors.orangeOriginal, text: AppColors.orangeOriginal);
  }

  String _getStatusText(String? status) {
    if (status == null || status.trim().isEmpty) return 'غير محدد';
    final s = status.toLowerCase().trim();
    if (RegExp(r'[\u0600-\u06FF]').hasMatch(status)) return status;
    switch (s) {
      case 'finished':
      case 'completed':
      case 'done':
        return 'مكتمل';
      case 'in_process':
      case 'in_progress':
      case 'processing':
        return 'قيد التنفيذ';
      case 'pending':
      case 'new':
        return 'جديد';
      case 'assigned':
        return 'معين';
      case 'cancelled':
      case 'canceled':
        return 'ملغي';
      case 'rejected':
        return 'مرفوض';
      case 'active':
        return 'نشط';
      default:
        return status;
    }
  }
}
