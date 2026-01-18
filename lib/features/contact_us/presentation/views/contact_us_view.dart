import 'package:easy_deal/core/shared_widgets/error_ui.dart';
import 'package:easy_deal/features/contact_us/presentation/view_model/contact_us_cubit.dart';
import 'package:easy_deal/features/contact_us/presentation/view_model/contact_us_states.dart';
import 'package:easy_deal/features/contact_us/presentation/views/widgets/contact_us_item.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  @override
  void initState() {
   context.read<ContactUsCubit>().contactUs();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.contactUs),
      body: BlocBuilder<ContactUsCubit , ContactUsStates>(
        builder: (context,state){
          var contactUsCubit = context.read<ContactUsCubit>();
          return Padding(
            padding:   EdgeInsets.all(20.0.r),
            child:
            state is ContactUsLoadingState ? CustomLoading():
                state is ContactUsErrorState ?ErrorWidgetUi(onRetry: (){
                  contactUsCubit.contactUs();
                }):
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LangKeys.contactInformation.tr(),style: AppStyles.primary16SemiBold,),
                Gap(24.h),
                ContactUsItem(svgImage: SvgImages.location2, title: "${contactUsCubit.contactUsModel?.data?.address}", onTap: (){
                  contactUsCubit.openMap("${contactUsCubit.contactUsModel?.data?.address}");
                }),
                ContactUsItem(svgImage: SvgImages.email, title: "${contactUsCubit.contactUsModel?.data?.email}", onTap: (){
                  contactUsCubit.sendEmail("${contactUsCubit.contactUsModel?.data?.email}");
                }),
                ContactUsItem(svgImage: SvgImages.phone, title: "${contactUsCubit.contactUsModel?.data?.phone}", onTap: (){
                  contactUsCubit.makeCall("${contactUsCubit.contactUsModel?.data?.phone}");
                }),
                ContactUsItem(svgImage: SvgImages.global, title: "${contactUsCubit.contactUsModel?.data?.whatsapp}", onTap: (){
                  contactUsCubit.openWebsite("${contactUsCubit.contactUsModel?.data?.whatsapp}");
                }),
              ],
            ),
          );
        },

      ),
    );
  }
}

