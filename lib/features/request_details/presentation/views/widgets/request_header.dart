import 'package:flutter/material.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../main_imports.dart';
import '../../../../requests/data/config/request_translations.dart';
import '../../../data/config/display_value.dart';
import '../../view_model/request_details_cubit.dart';

class RequestHeader extends StatelessWidget {
  const RequestHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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

    /// تاجات الصف الثاني: العنوان التفصيلي والمدينة
    final city = details?.locations?.isNotEmpty == true
        ? details!.locations!.first.city
        : null;
    final secondRowTags = <String>[
      ...?_tag(DisplayValue.text(details?.detailedAddress)),
      ...?_tag(context.isArabic
          ? DisplayValue.firstValid([city?.nameAr, city?.nameEn])
          : DisplayValue.firstValid([city?.nameEn, city?.nameAr])),
    ];

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
