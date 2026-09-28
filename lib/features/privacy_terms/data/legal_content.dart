import 'package:easy_deal/features/privacy_terms/data/models/legal_document_model.dart';
import 'package:easy_deal/features/privacy_terms/data/models/legal_section_model.dart';
import 'package:easy_deal/lang/lang_keys.dart';

/// Static text of the terms and the privacy policy, mirroring the website.
class LegalContent {
  const LegalContent._();

  static const LegalDocumentModel terms = LegalDocumentModel(
    titleKey: LangKeys.termsAndConditions,
    introKey: LangKeys.termsIntro,
    sections: [
      LegalSectionModel(
        titleKey: LangKeys.termsDefinitions,
        bulletKeys: [
          LangKeys.termsDefCompany,
          LangKeys.termsDefPlatform,
          LangKeys.termsDefUser,
          LangKeys.termsDefBroker,
          LangKeys.termsDefDeveloper,
          LangKeys.termsDefAd,
          LangKeys.termsDefSubscription,
        ],
      ),
      LegalSectionModel(
        titleKey: LangKeys.termsPlatformServices,
        bodyKey: LangKeys.termsPlatformServicesBody,
      ),
      LegalSectionModel(
        titleKey: LangKeys.termsAccountCreation,
        bodyKey: LangKeys.termsAccountCreationBody,
      ),
      LegalSectionModel(
        titleKey: LangKeys.termsUserObligations,
        bodyKey: LangKeys.termsUserObligationsBody,
        bulletKeys: [
          LangKeys.termsObligation1,
          LangKeys.termsObligation2,
          LangKeys.termsObligation3,
          LangKeys.termsObligation4,
          LangKeys.termsObligation5,
        ],
      ),
      LegalSectionModel(
        titleKey: LangKeys.termsPropertyAds,
        bodyKey: LangKeys.termsPropertyAdsBody,
      ),
      LegalSectionModel(
        titleKey: LangKeys.termsSubscriptions,
        bulletKeys: [
          LangKeys.termsSubscription1,
          LangKeys.termsSubscription2,
          LangKeys.termsSubscription3,
          LangKeys.termsSubscription4,
          LangKeys.termsSubscription5,
        ],
      ),
      LegalSectionModel(
        titleKey: LangKeys.termsPaymentAndRefund,
        bulletKeys: [LangKeys.termsPayment1, LangKeys.termsPayment2],
      ),
      LegalSectionModel(
        titleKey: LangKeys.termsIntellectualProperty,
        bodyKey: LangKeys.termsIntellectualPropertyBody,
      ),
      LegalSectionModel(
        titleKey: LangKeys.termsArtificialIntelligence,
        bodyKey: LangKeys.termsArtificialIntelligenceBody,
      ),
      LegalSectionModel(
        titleKey: LangKeys.termsLiabilityLimits,
        bodyKey: LangKeys.termsLiabilityLimitsBody,
      ),
      LegalSectionModel(
        titleKey: LangKeys.termsAccountSuspension,
        bodyKey: LangKeys.termsAccountSuspensionBody,
      ),
      LegalSectionModel(
        titleKey: LangKeys.termsForceMajeure,
        bodyKey: LangKeys.termsForceMajeureBody,
      ),
      LegalSectionModel(
        titleKey: LangKeys.termsModification,
        bodyKey: LangKeys.termsModificationBody,
      ),
      LegalSectionModel(
        titleKey: LangKeys.termsGoverningLaw,
        bodyKey: LangKeys.termsGoverningLawBody,
      ),
    ],
  );

  static const LegalDocumentModel privacy = LegalDocumentModel(
    titleKey: LangKeys.privacyPolicy,
    introKey: LangKeys.privacyIntro,
    sections: [
      LegalSectionModel(
        titleKey: LangKeys.privacyDefinitions,
        bulletKeys: [
          LangKeys.privacyDefCompany,
          LangKeys.privacyDefPlatform,
          LangKeys.privacyDefUser,
          LangKeys.privacyDefPersonalData,
          LangKeys.privacyDefUsageData,
          LangKeys.privacyDefCookies,
        ],
      ),
      LegalSectionModel(
        titleKey: LangKeys.privacyDataWeCollect,
        bodyKey: LangKeys.privacyDataWeCollectBody,
        bulletKeys: [
          LangKeys.privacyData1,
          LangKeys.privacyData2,
          LangKeys.privacyData3,
          LangKeys.privacyData4,
          LangKeys.privacyData5,
          LangKeys.privacyData6,
        ],
      ),
      LegalSectionModel(
        titleKey: LangKeys.privacyHowWeUseData,
        bodyKey: LangKeys.privacyHowWeUseDataBody,
        bulletKeys: [
          LangKeys.privacyUse1,
          LangKeys.privacyUse2,
          LangKeys.privacyUse3,
          LangKeys.privacyUse4,
          LangKeys.privacyUse5,
          LangKeys.privacyUse6,
          LangKeys.privacyUse7,
        ],
      ),
      LegalSectionModel(
        titleKey: LangKeys.privacyDataSharing,
        bodyKey: LangKeys.privacyDataSharingBody,
      ),
      LegalSectionModel(
        titleKey: LangKeys.privacyDataProtection,
        bodyKey: LangKeys.privacyDataProtectionBody,
      ),
      LegalSectionModel(
        titleKey: LangKeys.privacyCookies,
        bodyKey: LangKeys.privacyCookiesBody,
      ),
      LegalSectionModel(
        titleKey: LangKeys.privacyPropertyMedia,
        bodyKey: LangKeys.privacyPropertyMediaBody,
      ),
      LegalSectionModel(
        titleKey: LangKeys.privacyArtificialIntelligence,
        bodyKey: LangKeys.privacyArtificialIntelligenceBody,
      ),
      LegalSectionModel(
        titleKey: LangKeys.privacyUserRights,
        bodyKey: LangKeys.privacyUserRightsBody,
      ),
      LegalSectionModel(
        titleKey: LangKeys.privacyChildren,
        bodyKey: LangKeys.privacyChildrenBody,
      ),
      LegalSectionModel(
        titleKey: LangKeys.privacyPolicyUpdates,
        bodyKey: LangKeys.privacyPolicyUpdatesBody,
      ),
    ],
  );
}
