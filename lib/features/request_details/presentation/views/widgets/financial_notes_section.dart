import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/features/add_property/data/config/ap_options.dart';
import 'package:easy_deal/features/request_details/data/config/display_value.dart';
import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';

import '../../../../../main_imports.dart';

class FinancialNotesSection extends StatelessWidget {
  const FinancialNotesSection({super.key, this.attributes});

  final Attributes? attributes;

  static String? _expensesText(BuildContext context, Attributes? attributes) {
    final expenses = DisplayValue.list(attributes?.otherExpenses)
        .map((e) => ApOptions.label(e, context.isArabic))
        .where((label) => DisplayValue.isValid(label))
        .toList();
    if (expenses.isEmpty) return null;
    return expenses.join(', ');
  }

  static List<Widget?> _rows(BuildContext context, Attributes? attributes) {
    // نظام السداد: paymentMethod في الطلبات، وتكرار الإيجار/التأمين في الوحدات
    final rawPaymentSystem = DisplayValue.firstValidRaw([
      attributes?.paymentMethod,
      attributes?.rentRecurrence,
      attributes?.requiredInsurance,
    ]);
    return [
      optionalInfoRow(
        title: LangKeys.unitPrice.tr(),
        value: DisplayValue.withSuffix(
          DisplayValue.firstValidRaw(
              [attributes?.unitPrice, attributes?.averageUnitPriceMin]),
          LangKeys.egp.tr(),
        ),
      ),
      optionalInfoRow(
        title: LangKeys.brokerPriceSuggestions.tr(),
        value: DisplayValue.withSuffix(
          attributes?.unitPriceSuggestions,
          LangKeys.egp.tr(),
        ),
      ),
      optionalInfoRow(
        title: LangKeys.paymentSystem.tr(),
        value: DisplayValue.mapped(
          rawPaymentSystem,
          (raw) => ApOptions.label(raw?.toString(), context.isArabic),
        ),
      ),
      optionalInfoRow(
        title: LangKeys.otherExpenses.tr(),
        value: _expensesText(context, attributes),
      ),
      // الملاحظات بتتعرض في قسم "معلومات إضافية" فمحذوفة من هنا عشان ما تتكررش
    ];
  }

  static bool hasData(BuildContext context, Attributes? attributes) =>
      hasVisibleRows(_rows(context, attributes));

  @override
  Widget build(BuildContext context) {
    return RequestSection(
      title: LangKeys.financialInformation.tr(),
      child: InfoCard(children: _rows(context, attributes)),
    );
  }
}
