import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';
import '../../../../requests/data/config/request_translations.dart';
import '../../../data/config/display_value.dart';
import '../../view_model/request_details_cubit.dart';
import '../../view_model/request_details_states.dart';

class RequestHeader extends StatelessWidget {
  const RequestHeader({
    super.key,
    this.requestId,
  });

  /// رقم الطلب اللي جاي من الكارت — بيتعرض لو الـAPI ما رجّعش id
  final int? requestId;

  /// لون شارة الحالة حسب الحالة — نفس تقسيم ألوان كارت قائمة الطلبات
  static Color _statusColor(dynamic rawStatus) {
    switch (rawStatus?.toString()) {
      case 'new':
        return AppColors.primaryDark;
      case 'in_processing':
        return AppColors.orangeMedium;
      case 'finished':
      case 'completed':
        return AppColors.successDark;
      case 'rejected':
      case 'cancelled':
        return AppColors.errorDark;
      default:
        return AppColors.grayDarkest;
    }
  }

  @override
  Widget build(BuildContext context) {
    /// الهيدر بيتبني جوه BlocBuilder عشان شارة الحالة تتحدّث فوراً بعد
    /// تغيير الحالة. من غير كده الويدجت الـconst مابتتبنيش تاني أصلاً.
    return BlocBuilder<RequestDetailsCubit, RequestDetailsStates>(
      buildWhen: (prev, curr) =>
          curr is GetRequestDetailsSuccessState ||
          curr is UpdateRequestStatusSuccessState ||
          curr is MakeUnitSuccessState,
      builder: (context, state) => _buildHeader(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    var requestDetailsCubit = context.read<RequestDetailsCubit>();
    var details = requestDetailsCubit.requestDetailsModel?.data;

    final title = DisplayValue.mapped(details?.type, RequestTranslations.type);

    /// تاجات الصف الأول: نطاق التخصص ونوع الوحدة
    final firstRowTags = <String>[
      ...?_tag(DisplayValue.mapped(
        details?.specializationScope,
        RequestTranslations.specializationScope,
      )),
      ...?_tag(DisplayValue.mapped(details?.unit, RequestTranslations.unit)),
    ];

    /// تاجات الصف الثاني: المدينة بس — العنوان التفصيلي اتشال من العرض
    final city = details?.locations?.isNotEmpty == true
        ? details!.locations!.first.city
        : null;
    final secondRowTags = <String>[
      ...?_tag(context.isArabic
          ? DisplayValue.firstValid([city?.nameAr, city?.nameEn])
          : DisplayValue.firstValid([city?.nameEn, city?.nameAr])),
    ];

    /// الحالة ورقم الطلب — الاتنين بيختفوا لو مفيش قيمة صالحة
    final rawStatus = details?.status;
    final statusLabel =
        DisplayValue.mapped(rawStatus, RequestTranslations.status);
    final displayedId = DisplayValue.text(details?.id ?? requestId);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        16.w,
        8.h,
        16.w,
        24.h,
      ),
      decoration:   BoxDecoration(
        color: AppColors.primaryDark,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          /// Request Title
          if (title != null) ...[
            Text(title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 12),
          ],

          /// شارة الحالة + رقم الطلب
          if (statusLabel != null || displayedId != null) ...[
            Row(
              children: [
                if (statusLabel != null)
                  _StatusBadge(
                    label: statusLabel,
                    color: _statusColor(rawStatus),
                  ),
                if (statusLabel != null && displayedId != null)
                  const SizedBox(width: 10),
                if (displayedId != null)
                  Expanded(
                    child: Text(
                      '${LangKeys.requestNumber.tr()}: $displayedId',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
          ],

          /// First Row Tags
          if (firstRowTags.isNotEmpty)
            Wrap(
              spacing: 6,
              runSpacing: 7,
              children: firstRowTags
                  .map((tag) => _RequestTag(title: tag))
                  .toList(),
            ),

          if (firstRowTags.isNotEmpty && secondRowTags.isNotEmpty)
            const SizedBox(height: 7),

          /// Second Row Tags
          if (secondRowTags.isNotEmpty)
            Wrap(
              spacing: 6,
              runSpacing: 7,
              children: secondRowTags
                  .map((tag) => _RequestTag(title: tag))
                  .toList(),
            ),
        ],
      ),
    );
  }

  /// بيرجّع عنصر واحد لو القيمة صالحة، أو null عشان ما يتضافش للتاجات
  List<String>? _tag(String? value) => value == null ? null : [value];
}

/// شارة الحالة فوق الهيدر الكحلي: خلفية بيضا عشان اللون يبان على الكحلي
class _StatusBadge extends StatelessWidget {
  const _StatusBadge({
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _RequestTag extends StatelessWidget {
  final String title;

  const _RequestTag({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFDCEAFF),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF1234A6),
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
