import 'package:easy_localization/easy_localization.dart';

import '../../../../create_request/data/models/sub_areas_model.dart';
import '../../../../../main_imports.dart';
import '../../../data/models/areas_model.dart';
import '../../../data/models/cities_model.dart';
import '../../view_model/search_cubit.dart';
import '../../view_model/search_states.dart';

/// شرائح الفلتر النشطة فوق نتائج البحث.
///
/// بتعرض بالظبط الفلاتر اللي مفعّلة بأسمائها (نفس أسماء الشيت) وزرار ✕
/// بيشيلها واحدة واحدة ويعيد التحميل — عشان المستخدم يعرف إيه اللي بصفّي
/// النتائج لو طلعت فاضية (مثلاً كلمة بحث لسه مكتوبة أو نوع وحدة سابق).
class ActiveFiltersChips extends StatelessWidget {
  const ActiveFiltersChips({super.key});

  /// بيحوّل قيمة الفلتر (مثل `apartments`) لاسمها المعروض في الشيت.
  static String _labelOf(Map<String, String> map, String? value) {
    if (value == null || value.isEmpty) return '';
    for (final entry in map.entries) {
      if (entry.value == value) return entry.key;
    }
    return value;
  }

  static String? _nameById(List<Cities>? list, int? id, bool isArabic) {
    if (id == null) return null;
    for (final e in list ?? const <Cities>[]) {
      if (e.id == id) return isArabic ? (e.nameAr ?? e.nameEn) : (e.nameEn ?? e.nameAr);
    }
    return null;
  }

  static String? _areaNameById(List<Areas>? list, int? id, bool isArabic) {
    if (id == null) return null;
    for (final e in list ?? const <Areas>[]) {
      if (e.id == id) return isArabic ? (e.nameAr ?? e.nameEn) : (e.nameEn ?? e.nameAr);
    }
    return null;
  }

  static String? _subAreaNameById(List<SubArea>? list, int? id, bool isArabic) {
    if (id == null) return null;
    for (final e in list ?? const <SubArea>[]) {
      if (e.id == id) return isArabic ? (e.nameAr ?? e.nameEn) : (e.nameEn ?? e.nameAr);
    }
    return null;
  }

  /// نص النطاق: لو الاتنين موجودين بينهم بـ «-»، وغير كده بيعرض اللي موجود
  /// ومعاه عنوانه (السعر من / السعر إلى).
  static String _rangeLabel({
    required String from,
    required String to,
    required String fromLabel,
    required String toLabel,
  }) {
    if (from.isNotEmpty && to.isNotEmpty) return '$from - $to';
    if (from.isNotEmpty) return '$fromLabel: $from';
    return '$toLabel: $to';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();
        final isArabic = context.isArabic;
        // قراءة من آخر طلب مُطبَّق مش من الحالة الحية في الشيت
        final applied = cubit.applied;
        int? appliedId(String key) {
          final v = applied[key];
          return v is int ? v : null;
        }

        String? appliedText(String key) {
          final v = applied[key];
          return v is String && v.isNotEmpty ? v : null;
        }

        final chips = <MapEntry<String, String>>[];
        void add(String key, String label, bool visible) {
          if (visible && label.trim().isNotEmpty) {
            chips.add(MapEntry(key, label));
          }
        }

        final keyword = appliedText('search') ?? '';
        add(
          'search',
          '${LangKeys.search.tr()}: $keyword',
          keyword.isNotEmpty,
        );

        final cityId = appliedId('city');
        final cityName =
            _nameById(cubit.citiesModel?.data, cityId, isArabic) ?? cubit.city;
        add(
          'city',
          '${LangKeys.city.tr()}: ${cityName ?? ''}',
          cityId != null,
        );

        final areaId = appliedId('area');
        final areaName =
            _areaNameById(cubit.areasModel?.data, areaId, isArabic) ??
                cubit.area;
        add(
          'area',
          '${LangKeys.area.tr()}: ${areaName ?? ''}',
          areaId != null,
        );

        final subAreaId = appliedId('subArea');
        final subAreaName =
            _subAreaNameById(cubit.subAreasModel?.data, subAreaId, isArabic) ??
                cubit.subArea;
        add(
          'subArea',
          '${LangKeys.subArea.tr()}: ${subAreaName ?? ''}',
          subAreaId != null,
        );

        final properType = appliedText('unitType');
        add(
          'unitType',
          _labelOf(cubit.properTypes, properType),
          properType != null,
        );
        final theProcess = appliedText('unitOperation');
        add(
          'unitOperation',
          _labelOf(cubit.process, theProcess),
          theProcess != null,
        );
        final deliveryStatus = appliedText('deliveryStatus');
        add(
          'deliveryStatus',
          _labelOf(cubit.status, deliveryStatus),
          deliveryStatus != null,
        );
        final compoundType = appliedText('compoundType');
        add(
          'compoundType',
          _labelOf(cubit.types, compoundType),
          compoundType != null,
        );

        final priceFrom = appliedText('priceFrom') ?? '';
        final priceTo = appliedText('priceTo') ?? '';
        add(
          'price',
          '${LangKeys.price.tr()}: ${_rangeLabel(
            from: priceFrom,
            to: priceTo,
            fromLabel: LangKeys.priceFrom.tr(),
            toLabel: LangKeys.priceTo.tr(),
          )}',
          priceFrom.isNotEmpty || priceTo.isNotEmpty,
        );

        final areaFrom = appliedText('areaFrom') ?? '';
        final areaTo = appliedText('areaTo') ?? '';
        add(
          'unitArea',
          '${LangKeys.unitArea.tr()}: ${_rangeLabel(
            from: areaFrom,
            to: areaTo,
            fromLabel: LangKeys.areaFrom.tr(),
            toLabel: LangKeys.areaTo.tr(),
          )}',
          areaFrom.isNotEmpty || areaTo.isNotEmpty,
        );

        if (chips.isEmpty) return const SizedBox.shrink();

        return Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Wrap(
            spacing: 6.w,
            runSpacing: 6.h,
            children: chips
                .map(
                  (chip) => _ActiveChip(
                    label: chip.value,
                    onClear: () => cubit.clearFilter(chip.key),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}

class _ActiveChip extends StatelessWidget {
  const _ActiveChip({required this.label, required this.onClear});

  final String label;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.primaryDark.withOpacity(0.10),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primaryDark.withOpacity(0.45)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.black12Medium.copyWith(
                color: AppColors.primaryDark,
                fontSize: 11.sp,
              ),
            ),
          ),
          Gap(4.w),
          InkWell(
            onTap: onClear,
            borderRadius: BorderRadius.circular(10.r),
            child: Icon(
              Icons.close,
              size: 14.sp,
              color: AppColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }
}
