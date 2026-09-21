import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';

import '../../../../../main_imports.dart';

class FinancialNotesSection extends StatelessWidget {
  const FinancialNotesSection({super.key, this.attributes});

  final Attributes? attributes;

  String _expensesText() {
    final expenses = attributes?.otherExpenses;
    if (expenses == null || expenses.isEmpty) return '-';
    return expenses.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    final hasSuggestion = attributes?.unitPriceSuggestions != null;
    return RequestSection(
      title: 'FINANCIAL & NOTES',
      child: InfoCard(
        children: [
          InfoRow(
            title: 'Unit Price',
            value: attributes?.unitPrice != null ? '${attributes!.unitPrice} EGP' : '-',
          ),
          InfoRow(
            title: 'Broker Price Suggestions',
            value: hasSuggestion ? '${attributes!.unitPriceSuggestions} EGP' : 'No',
          ),
          InfoRow(
            title: 'Payment System',
            value: attributes?.rentRecurrence?.toString() ??
                attributes?.requiredInsurance?.toString() ??
                '-',
          ),
          InfoRow(
            title: 'Other Expenses',
            value: _expensesText(),
          ),
          InfoRow(
            title: 'Other Notes',
            value: attributes?.notes?.isNotEmpty == true ? attributes!.notes! : '-',
          ),
        ],
      ),
    );
  }
}