import 'package:easy_deal/features/privacy_terms/presentation/view_model/privacy_terms_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/app_services/remote_services/service_locator.dart';
import '../../../../core/shared_widgets/error_ui.dart';
import '../../data/repos/privacy_terms_repo_imple.dart';
import '../view_model/privacy_terms_cubit.dart';

class PrivacyTermsView extends StatelessWidget {
  const PrivacyTermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.privacyAndTerms),
      body: BlocProvider(
        create: (context)=>PrivacyTermsCubit(getIt.get<PrivacyTermsRepoImpl>())..getTerms(),
        child: BlocBuilder<PrivacyTermsCubit , PrivacyTermsStates>(
            builder: (context,state) {
              var privacyTermsCubit = context.read<PrivacyTermsCubit>();
              return
                state is GetPrivacyTermsLoadingState ? CustomLoading():
                state is GetPrivacyTermsErrorState ? ErrorWidgetUi(onRetry: (){
                  privacyTermsCubit.getTerms();
                }):
                Padding(
                padding:   EdgeInsets.all(20.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LangKeys.whoWeAre.tr(),style: AppStyles.black16SemiBold,),
                    Gap(20.h),
                    Text(privacyTermsCubit.termsModel!.data!.content.toString())

                  ],
                ),
              );
            }

        ),
      ),
    );
  }
}
