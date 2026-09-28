import 'package:easy_deal/features/about_us/data/models/about_us_highlight_model.dart';
import 'package:easy_deal/lang/lang_keys.dart';
import 'package:flutter/material.dart';

/// Static content of the About Us page, mirroring the website page.
class AboutUsContent {
  const AboutUsContent._();

  static const List<String> services = [
    LangKeys.propertySaleAndPurchase,
    LangKeys.longTermRentals,
    LangKeys.shortTermStays,
    LangKeys.professionalPropertyManagement,
  ];

  static const List<AboutUsHighlightModel> missionHighlights = [
    AboutUsHighlightModel(
      titleKey: LangKeys.higherEfficiency,
      descriptionKey: LangKeys.higherEfficiencyDescription,
      icon: Icons.bolt_rounded,
    ),
    AboutUsHighlightModel(
      titleKey: LangKeys.preciseReach,
      descriptionKey: LangKeys.preciseReachDescription,
      icon: Icons.person_outline_rounded,
    ),
    AboutUsHighlightModel(
      titleKey: LangKeys.trustAndSafety,
      descriptionKey: LangKeys.trustAndSafetyDescription,
      icon: Icons.shield_outlined,
    ),
    AboutUsHighlightModel(
      titleKey: LangKeys.unifiedSystem,
      descriptionKey: LangKeys.unifiedSystemDescription,
      icon: Icons.work_outline_rounded,
    ),
  ];

  static const List<AboutUsHighlightModel> visionHighlights = [
    AboutUsHighlightModel(
      titleKey: LangKeys.smartMatching,
      descriptionKey: LangKeys.smartMatchingDescription,
    ),
    AboutUsHighlightModel(
      titleKey: LangKeys.centralizedDataManagement,
      descriptionKey: LangKeys.centralizedDataManagementDescription,
    ),
    AboutUsHighlightModel(
      titleKey: LangKeys.professionalTools,
      descriptionKey: LangKeys.professionalToolsDescription,
    ),
  ];
}
