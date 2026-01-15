import 'package:easy_deal/core/shared_widgets/error_ui.dart';
import 'package:easy_deal/features/about_us/presentation/view_model/about_us_cubit.dart';
import 'package:easy_deal/features/about_us/presentation/view_model/about_us_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.all(20.0.r),
      child: BlocBuilder<AboutUsCubit , AboutUsStates>(
        builder: (context,state){
          var aboutUsCubit = context.read<AboutUsCubit>();
          return
            state is GetAboutUsLoadingState ? CustomLoading():
                state is GetAboutUsErrorState ? ErrorWidgetUi(onRetry: (){
                  aboutUsCubit.getAboutUs();
                }):
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LangKeys.whoWeAre.tr(),style: AppStyles.black16SemiBold,),
              Gap(20.h),
              context.isArabic ?    Text(aboutUsCubit.aboutUsModel!.data!.descriptionAr.toString()):
              Text(aboutUsCubit.aboutUsModel!.data!.descriptionEn.toString()),
            ],
          );
        },

      ),
    );
  }
}
