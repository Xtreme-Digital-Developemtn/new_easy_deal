import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';

import '../../../../../main_imports.dart';

class BasicInformationSection extends StatelessWidget {
  const BasicInformationSection({super.key, this.data});

  final Data? data;

  @override
  Widget build(BuildContext context) {
    return RequestSection(
      title: 'BASIC INFORMATION',
      child: InfoCard(
        children: [
          InfoRow(
            title: 'Operation Type',
            value: data?.type?.toString() ?? '-',
          ),
          InfoRow(
            title: 'Specialization',
            value: data?.specializationScope?.toString() ?? '-',
          ),
          InfoRow(
            title: 'Unit Type',
            value: data?.unit?.toString() ?? '-',
          ),
        ],
      ),
    );
  }
}