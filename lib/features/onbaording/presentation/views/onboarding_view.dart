import 'package:easy_deal/features/onbaording/presentation/views/widgets/onboarding_item.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonText: LangKeys.signUp.tr(),
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: AppColors.primaryDark,
        ),
        onFinish: (){
       //   context.pushNamed(Routes.);
        },
        skipTextButton: Text( LangKeys.skip.tr(),style: AppStyles.primary16SemiBold,),
        trailing: Text( LangKeys.signIn.tr(),style: AppStyles.primary16SemiBold,),
        trailingFunction: (){
          context.pushNamed(Routes.loginView);
        },
        background: [
          Image.asset(JpgImages.onboarding2,height: 350.h,width: 350.w,fit: BoxFit.cover,),
          Image.asset(JpgImages.onboarding3,height: 350.h,width: 350.w,fit: BoxFit.cover,),
          Image.asset(JpgImages.onboarding1,height: 350.h,width: 350.w,fit: BoxFit.cover,),
        ],
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          OnboardingItem(title: LangKeys.findYourPerfectHomeWithEase),
          OnboardingItem(title: LangKeys.sellOrRentYourPropertyInSimpleSteps),
          OnboardingItem(title: LangKeys.fromBeginningToEndWeAreWithYouOnYourRealEstateJourney),
        ],
      ),
    );
  }
}
