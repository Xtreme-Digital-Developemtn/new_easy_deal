import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/property_details_section.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_information_section.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/status_information_section.dart';

import '../../../../../main_imports.dart';
import '../../view_model/request_details_cubit.dart';
import 'additional_information_section.dart';
import 'basic_information_section.dart';
import 'financial_notes_section.dart';
import 'location_details_section.dart';

class RequestOverview extends StatelessWidget {
  const RequestOverview({super.key, this.data});

  /// Pass [data] explicitly - if null it will be resolved from cubit
  final Data? data;

  @override
  Widget build(BuildContext context) {
    // Resolve real data from model: prefers explicit param, falls back to cubit
    final resolved = data ?? context.read<RequestDetailsCubit>().requestDetailsModel?.data;

    /// القسم اللي كل حقوله فاضية بيختفي هو وعنوانه والـDivider والمسافة
    /// اللي بعده، فالترتيب والـLayout بيفضلوا مظبوطين.
    final sections = <Widget>[
      if (BasicInformationSection.hasData(resolved))
        BasicInformationSection(data: resolved),
      if (LocationDetailsSection.hasData(context, resolved))
        LocationDetailsSection(data: resolved),
      if (PropertyDetailsSection.hasData(context, resolved?.attributes))
        PropertyDetailsSection(attributes: resolved?.attributes),
      if (StatusInformationSection.hasData(context, resolved))
        StatusInformationSection(data: resolved),
      if (AdditionalInformationSection.hasData(context, resolved?.attributes))
        AdditionalInformationSection(attributes: resolved?.attributes),
      if (FinancialNotesSection.hasData(context, resolved?.attributes))
        FinancialNotesSection(attributes: resolved?.attributes),
      if (RequestInformationSection.hasData(resolved))
        RequestInformationSection(data: resolved),
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < sections.length; i++) ...[
            if (i != 0) const SizedBox(height: 24),
            sections[i],
          ],
        ],
      ),
    );
  }
}
