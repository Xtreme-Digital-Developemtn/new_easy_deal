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

class _LastRequestsState extends State<LastRequests> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<BrokerHomeCubit>().getLastRequestsModelInHome(
          brokerId: widget.brokerId,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrokerHomeCubit, BrokerHomeStates>(
      builder: (context, state) {
        final lastRequests =
            context.watch<BrokerHomeCubit>().lastRequestsModelInHome;

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

  Widget _buildRequestsTable(List<LastRequestItem> requests) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
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
                  Icon(
                    Icons.receipt_long_rounded,
                    color: Colors.white,
                    size: 22.sp,
                  ),
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
                    padding: EdgeInsets.symmetric(
                        horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      '${requests.length} ${LangKeys.requests.tr()}',
                      style: AppStyles.black14Medium.copyWith(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ...requests.asMap().entries.map((entry) {
              final index = entry.key;
              final request = entry.value;
              final isEven = index.isEven;
              return _buildRow(request, isEven);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(LastRequestItem request, bool isEven) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: isEven
            ? Colors.white
            : AppColors.grayLight.withValues(alpha: 0.06),
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade100, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              _getTitleArabic(request),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.black14Medium.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              request.user?.name ?? '-',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.black14Medium.copyWith(
                fontSize: 12.sp,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color:
                      AppColors.primaryDark.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  _getRoleArabic(request.user?.role),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyles.black14Medium.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                _formatDate(request.createdAt),
                textAlign: TextAlign.center,
                style: AppStyles.black14Medium.copyWith(
                  fontSize: 11.sp,
                  color: AppColors.primaryDark.withValues(alpha: 0.7),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(child: _buildStatus(request.status)),
          ),
        ],
      ),
    );
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
    switch (role) {
      case 'broker':
        return 'وسيط';
      case 'realEstateBrokageCompany':
        return 'شركة وساطة عقارية';
      case 'client':
        return 'عميل';
      default:
        return role ?? '-';
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.orangeOriginal.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        _getStatusText(status),
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.orangeOriginal,
        ),
      ),
    );
  }

  String _getStatusText(String? status) {
    switch (status) {
      case 'finished':
        return 'مكتمل';
      case 'in_process':
        return 'قيد التنفيذ';
      case 'pending':
        return 'جديد';
      case 'assigned':
        return 'معين';
      default:
        return status ?? '-';
    }
  }
}
