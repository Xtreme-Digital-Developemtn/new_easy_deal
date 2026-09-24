import 'package:easy_deal/features/add_property/data/config/ap_fields.dart';
import 'package:easy_deal/features/add_property/data/config/ap_options.dart';
import 'package:easy_deal/features/unit_details/data/models/unit_details_model.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class UnitInformation extends StatelessWidget {
  const UnitInformation({super.key,required this.beds, required this.baths, required this.sqft, required
  this.poal, required this.builtIn, this.price, this.additionalDetails});
  final dynamic beds;
  final dynamic baths;
  final dynamic sqft;
  final dynamic poal;
  final dynamic builtIn;
  final dynamic price;
  final AdditionalDetails? additionalDetails;

  @override
  Widget build(BuildContext context) {
    List<String> infoNames = [
      LangKeys.numberOfRooms.tr(),
      LangKeys.bathrooms.tr(),
      LangKeys.unitArea.tr(),
      LangKeys.swimmingPoolLabel.tr(),
      LangKeys.buildingNumberLabel.tr(),
    ];
    List<dynamic> infoValues = [beds, baths, sqft, poal, builtIn];

    if (price != null) {
      infoNames.add(LangKeys.price.tr());
      infoValues.add("$price ${LangKeys.egp.tr()}");
    }

    if (additionalDetails?.mallName != null) {
      infoNames.add(ApFields.metaOf('mallName').label.value(context.isArabic));
      infoValues.add(additionalDetails!.mallName);
    }
    if (additionalDetails?.floorNumber != null) {
      infoNames.add(ApFields.metaOf('floorNumber').label.value(context.isArabic));
      infoValues.add(additionalDetails!.floorNumber);
    }
    if (additionalDetails?.legalStatus != null) {
      infoNames.add(ApFields.metaOf('legalStatus').label.value(context.isArabic));
      infoValues.add(ApOptions.label(additionalDetails!.legalStatus, context.isArabic));
    }
    if (additionalDetails?.financialStatus != null) {
      infoNames.add(ApFields.metaOf('financialStatus').label.value(context.isArabic));
      infoValues.add(ApOptions.label(additionalDetails!.financialStatus, context.isArabic));
    }
    if (additionalDetails?.furnishingStatus != null) {
      infoNames.add(ApFields.metaOf('furnishingStatus').label.value(context.isArabic));
      infoValues.add(ApOptions.label(additionalDetails!.furnishingStatus, context.isArabic));
    }

    return Container(
      padding: EdgeInsets.all(12.r),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.gray1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LangKeys.unitInformation.tr(),
            style: AppStyles.blueDark14Bold,
          ),
          Gap(16.h),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 1.2,
            ),
            itemCount: infoNames.length,
            itemBuilder: (context, index) {
              return _buildInfoItem(
                name: infoNames[index],
                value: infoValues[index]?.toString() ?? LangKeys.notAvailable.tr(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({required String name, required String value}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: AppStyles.blueDark14Bold,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Text(
            name,
            style: AppStyles.gray10Medium,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }


}