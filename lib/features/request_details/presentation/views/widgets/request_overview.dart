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

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BasicInformationSection(data: resolved),
          const SizedBox(height: 24),

          LocationDetailsSection(data: resolved),
          const SizedBox(height: 24),

          PropertyDetailsSection(attributes: resolved?.attributes),
          const SizedBox(height: 24),

          StatusInformationSection(data: resolved),
          const SizedBox(height: 24),

          AdditionalInformationSection(attributes: resolved?.attributes),
          const SizedBox(height: 24),

          FinancialNotesSection(attributes: resolved?.attributes),
          const SizedBox(height: 24),

          RequestInformationSection(data: resolved),
        ],
      ),
    );
  }
}