import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';

import '../../../../../main_imports.dart';
import '../../../../requests/data/config/request_translations.dart';

class BasicInformationSection extends StatelessWidget {
  const BasicInformationSection({super.key, this.data});

  final Data? data;

  @override
  Widget build(BuildContext context) {
    return RequestSection(
      title: LangKeys.basicInformation.tr(),
      child: InfoCard(
        children: [
          InfoRow(
            title: LangKeys.operationType.tr(),
            value: data?.type != null ? RequestTranslations.type(data!.type) : '-',
          ),
          InfoRow(
            title: LangKeys.scopeOfSpecialization.tr(),
            value: data?.specializationScope != null
                ? RequestTranslations.specializationScope(data!.specializationScope)
                : '-',
          ),
          InfoRow(
            title: LangKeys.unitType.tr(),
            value: data?.unit != null ? RequestTranslations.unit(data!.unit) : '-',
          ),
        ],
      ),
    );
  }
}